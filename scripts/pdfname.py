#!/usr/bin/env python3
"""pdfname - rename PDFs in a directory to short, descriptive names using the
first page's text and the Claude Code CLI (`claude -p`).

Usage:
    pdfname.py DIR [--context "interview material: python sql fastapi"]   # dry run
    pdfname.py DIR --apply                                                # rename
    pdfname.py DIR --undo                                                 # revert last run
    pdfname.py DIR --debug                                                # verbose logs on stderr
"""

import argparse
import json
import logging
import re
import shutil
import subprocess
import sys
import tempfile
import time
from datetime import datetime
from pathlib import Path

LOG_NAME = ".pdfname_log.json"
ALREADY_NAMED = re.compile(r"^[a-z0-9_+]+$")
DEFAULT_MODEL = "haiku"  # naming is easy; a small model is much faster and cheaper
SYSTEM_PROMPT = "You are a file-naming tool. Follow the user's rules exactly and reply with JSON only."
MAX_CHARS = 1500
MIN_TEXT_LEN = 30
MAX_NAME_LEN = 50

log = logging.getLogger("pdfname")
STATS = {"claude_calls": 0, "cost_usd": 0.0}

RULES = """You rename PDF files. For each item below you get the text of the PDF's first page.
Return a short descriptive filename (no extension) for each one.

Rules:
- lowercase, words separated by "_", only a-z 0-9 _ +
- 2 to 5 words, keywords only, no filler words (the, of, and, for, asked, top...)
- umbrella/category word FIRST, then the specifics, so related files sort together
  (interview_questions_python, not python_interview_questions;
   notes_linux, cheatsheet_git, book_*, paper_*, report_*, resume_*, invoice_*, etc.)
- use short forms where common: ds, dsa, db, os, cn, oop, ml, ai, genai, llm, sql
- keep a distinguishing detail if present (a count like 50+, a year, a company, a version)
- the optional folder context is only a hint for categories, never the name itself
- if two items are about the same thing, make their names consistent
- names must be unique across the batch and must not repeat the names in "already used"

Examples:
  "Asked in Top Companies / Interview Questions & Answers / Data Science / Industrial Training..."
      -> interview_questions_ds
  "50+ Data Structure and Algorithms Interview Questions for Programmers / javinpaul ..."
      -> interview_questions_dsa_50+

Reply with ONLY a JSON object mapping each item id to its name, e.g. {"f1": "name_a", "f2": "name_b"}.
No prose, no code fences."""


def setup_logging(debug: bool):
    logging.basicConfig(
        level=logging.DEBUG if debug else logging.WARNING,
        format="%(asctime)s.%(msecs)03d %(levelname)-5s %(message)s",
        datefmt="%H:%M:%S",
        stream=sys.stderr,
    )


def oneline(s: str, n: int = 100) -> str:
    s = re.sub(r"\s+", " ", s or "").strip()
    return s if len(s) <= n else s[:n] + "..."


def die(msg):
    print(f"error: {msg}", file=sys.stderr)
    sys.exit(1)


def check_tools():
    claude, pdftotext = shutil.which("claude"), shutil.which("pdftotext")
    log.debug("tools: claude=%s pdftotext=%s", claude, pdftotext)
    if not claude:
        die("Claude Code CLI not found. Install it and run `claude` once to log in, then retry.")
    if not pdftotext:
        die("pdftotext not found. Install poppler (NixOS: poppler_utils).")


def looks_named(stem: str) -> bool:
    """True if the stem already looks like one of our names: clean charset, has a
    letter, and has at least one '_' separator. Timestamp names (1758805256813)
    and single words (python) are NOT considered named."""
    return bool(ALREADY_NAMED.match(stem)) and "_" in stem and re.search(r"[a-z]", stem) is not None


def ocr_first_page(pdf: Path) -> str:
    """Fallback for scanned PDFs: rasterize page 1 and OCR it (needs pdftoppm + tesseract)."""
    if not (shutil.which("pdftoppm") and shutil.which("tesseract")):
        log.debug("ocr %s: skipped, pdftoppm/tesseract not installed", pdf.name)
        return ""
    t0 = time.perf_counter()
    with tempfile.TemporaryDirectory() as td:
        base = Path(td) / "page"
        try:
            subprocess.run(
                ["pdftoppm", "-f", "1", "-l", "1", "-r", "150", "-png", "-singlefile", str(pdf), str(base)],
                capture_output=True, timeout=60, check=True,
            )
            proc = subprocess.run(
                ["tesseract", str(base.with_suffix(".png")), "-", "-l", "eng"],
                capture_output=True, text=True, timeout=90,
            )
        except (subprocess.SubprocessError, OSError) as e:
            log.debug("ocr %s: FAILED (%s: %s)", pdf.name, type(e).__name__, oneline(str(e), 200))
            return ""
    out = re.sub(r"[ \t]+", " ", proc.stdout)
    out = re.sub(r"\n\s*\n+", "\n", out).strip()
    log.debug("ocr %s: %d chars in %.1fs | %r", pdf.name, len(out), time.perf_counter() - t0, oneline(out, 80))
    return out[:MAX_CHARS]


def first_page_text(pdf: Path) -> str:
    t0 = time.perf_counter()
    try:
        proc = subprocess.run(
            ["pdftotext", "-f", "1", "-l", "1", "-layout", str(pdf), "-"],
            capture_output=True, text=True, timeout=30,
        )
    except (subprocess.TimeoutExpired, OSError) as e:
        log.debug("extract %s: FAILED (%s: %s)", pdf.name, type(e).__name__, e)
        return ""
    if proc.returncode != 0:
        log.debug("extract %s: pdftotext rc=%d stderr=%r", pdf.name, proc.returncode, oneline(proc.stderr, 200))
    out = re.sub(r"[ \t]+", " ", proc.stdout)
    out = re.sub(r"\n\s*\n+", "\n", out).strip()
    log.debug(
        "extract %s: %d raw chars -> %d kept in %.0fms | %r",
        pdf.name, len(proc.stdout), min(len(out), MAX_CHARS),
        (time.perf_counter() - t0) * 1000, oneline(out, 80),
    )
    return out[:MAX_CHARS]


def sanitize(name: str) -> str:
    name = name.strip().lower()
    if name.endswith(".pdf"):
        name = name[:-4]
    name = re.sub(r"[^a-z0-9+]+", "_", name)
    name = re.sub(r"_+", "_", name).strip("_")
    if len(name) > MAX_NAME_LEN:
        cut = name[:MAX_NAME_LEN]
        name = cut.rsplit("_", 1)[0] if "_" in cut else cut
    return name


def extract_json(text: str) -> dict:
    text = text.strip()
    text = re.sub(r"^```(?:json)?|```$", "", text, flags=re.M).strip()
    start, end = text.find("{"), text.rfind("}")
    if start == -1 or end == -1:
        raise ValueError("no JSON object in reply")
    return json.loads(text[start:end + 1])


def ask_claude(items: dict, context: str, used: list, model: str | None, batch_no: int) -> dict:
    parts = [RULES, ""]
    if context:
        parts.append(f"Folder context (optional hint): {context}\n")
    if used:
        parts.append("Already used names: " + ", ".join(used) + "\n")
    for fid, text in items.items():
        parts.append(f"--- {fid} ---\n{text}\n")
    prompt = "\n".join(parts)

    # Slim headless call: no tools, tiny system prompt, no session file, no MCP/skills,
    # and a neutral cwd so no project CLAUDE.md gets loaded. Keeps it fast and cheap.
    cmd = [
        "claude", "-p", "--output-format", "json",
        "--tools", "",
        "--system-prompt", SYSTEM_PROMPT,
        "--no-session-persistence",
        "--strict-mcp-config",
        "--disable-slash-commands",
        "--setting-sources", "user",
        "--model", model or DEFAULT_MODEL,
    ]
    log.debug(
        "batch %d: %d items, prompt=%d chars, already_used=%d, cmd=%s",
        batch_no, len(items), len(prompt), len(used), " ".join(cmd),
    )

    last_err = None
    for attempt in (1, 2):  # one retry
        t0 = time.perf_counter()
        STATS["claude_calls"] += 1
        try:
            proc = subprocess.run(
                cmd, input=prompt, capture_output=True, text=True, timeout=180,
                cwd=tempfile.gettempdir(),
            )
            log.debug(
                "batch %d attempt %d: rc=%d stdout=%d chars stderr=%d chars in %.1fs",
                batch_no, attempt, proc.returncode, len(proc.stdout), len(proc.stderr),
                time.perf_counter() - t0,
            )
            if proc.returncode != 0:
                raise RuntimeError(proc.stderr.strip() or "claude exited non-zero")
            envelope = json.loads(proc.stdout)
            if isinstance(envelope, dict):
                cost = envelope.get("total_cost_usd") or envelope.get("cost_usd") or 0
                STATS["cost_usd"] += cost
                log.debug(
                    "batch %d: envelope is_error=%s duration_ms=%s turns=%s cost_usd=%s",
                    batch_no, envelope.get("is_error"), envelope.get("duration_ms"),
                    envelope.get("num_turns"), cost or "n/a",
                )
                reply = envelope.get("result", "")
            else:
                reply = proc.stdout
            log.debug("batch %d: reply=%r", batch_no, oneline(reply, 400))
            parsed = extract_json(reply)
            log.debug("batch %d: parsed %d name(s)", batch_no, len(parsed))
            return parsed
        except Exception as e:  # noqa: BLE001
            last_err = e
            log.debug("batch %d attempt %d: ERROR %s: %s", batch_no, attempt, type(e).__name__, oneline(str(e), 300))
    log.warning("batch %d failed after retry (%s)", batch_no, last_err)
    return {}


def unique(name: str, taken: set) -> str:
    if name not in taken:
        return name
    i = 2
    while f"{name}_{i}" in taken:
        i += 1
    return f"{name}_{i}"


def load_log(d: Path) -> list:
    p = d / LOG_NAME
    if p.exists():
        try:
            runs = json.loads(p.read_text())
            log.debug("log: loaded %d previous run(s) from %s", len(runs), p)
            return runs
        except json.JSONDecodeError:
            log.debug("log: %s is corrupt, ignoring", p)
    else:
        log.debug("log: %s does not exist yet", p)
    return []


def do_undo(d: Path):
    runs = load_log(d)
    if not runs:
        die("nothing to undo (no log found).")
    run = runs.pop()
    log.debug("undo: reverting run from %s with %d move(s)", run.get("time"), len(run["moves"]))
    n = 0
    for m in reversed(run["moves"]):
        src, dst = d / m["new"], d / m["old"]
        if not src.exists():
            print(f"skip (missing): {m['new']}")
            log.debug("undo: skip, %s missing", m["new"])
        elif dst.exists():
            print(f"skip (target exists): {m['old']}")
            log.debug("undo: skip, %s already exists", m["old"])
        else:
            src.rename(dst)
            n += 1
            log.debug("undo: %s -> %s", m["new"], m["old"])
    (d / LOG_NAME).write_text(json.dumps(runs, indent=2))
    log.debug("undo: %d run(s) left in log", len(runs))
    print(f"reverted {n} file(s).")


def main():
    t_start = time.perf_counter()
    ap = argparse.ArgumentParser(description="Rename PDFs from their first page using Claude Code.")
    ap.add_argument("dir", type=Path)
    ap.add_argument("--context", default="", help="optional hint, e.g. 'interview material: python sql'")
    ap.add_argument("--apply", action="store_true", help="actually rename (default is dry run)")
    ap.add_argument("--undo", action="store_true", help="revert the last applied run in this dir")
    ap.add_argument("--all", action="store_true", help="also process files that already look renamed")
    ap.add_argument("--batch-size", type=int, default=10)
    ap.add_argument("--model", default=None, help=f"model alias for `claude --model` (default: {DEFAULT_MODEL})")
    ap.add_argument("--debug", action="store_true", help="verbose logs on stderr")
    args = ap.parse_args()

    setup_logging(args.debug)
    log.debug("args: %s", {k: str(v) for k, v in vars(args).items()})

    d = args.dir.expanduser().resolve()
    if not d.is_dir():
        die(f"not a directory: {d}")
    log.debug("dir: %s", d)

    if args.undo:
        do_undo(d)
        return

    check_tools()

    pdfs = sorted(p for p in d.iterdir() if p.is_file() and p.suffix.lower() == ".pdf")
    todo = [p for p in pdfs if args.all or not looks_named(p.stem)]
    skipped_named = len(pdfs) - len(todo)
    log.debug("scan: %d pdf(s), %d to process, %d skipped (already named)", len(pdfs), len(todo), skipped_named)
    if skipped_named:
        for p in pdfs:
            if p not in todo:
                log.debug("scan: skip %s (already looks renamed)", p.name)

    texts, flagged = {}, []
    for p in todo:
        t = first_page_text(p)
        if len(t) < MIN_TEXT_LEN:
            log.debug("extract %s: only %d chars, trying OCR", p.name, len(t))
            t = ocr_first_page(p)
        if len(t) < MIN_TEXT_LEN:
            flagged.append(p.name)
            log.debug("flag %s: only %d chars of text even after OCR, min is %d", p.name, len(t), MIN_TEXT_LEN)
        else:
            texts[p] = t

    taken = {p.stem for p in pdfs}  # names currently in the dir
    plan = []  # (old Path, new stem)
    used_by_llm = []

    items = list(texts.items())
    n_batches = (len(items) + args.batch_size - 1) // args.batch_size
    for bi, i in enumerate(range(0, len(items), args.batch_size), start=1):
        chunk = items[i:i + args.batch_size]
        ids = {f"f{j + 1}": (p, t) for j, (p, t) in enumerate(chunk)}
        print(f"asking Claude: files {i + 1}-{i + len(chunk)} of {len(items)}...", file=sys.stderr)
        log.debug("batch %d/%d ids: %s", bi, n_batches, {k: v[0].name for k, v in ids.items()})
        reply = ask_claude({k: v[1] for k, v in ids.items()}, args.context, used_by_llm[-40:], args.model, bi)
        missing = [k for k in ids if k not in reply]
        extra = [k for k in reply if k not in ids]
        if missing or extra:
            log.debug("batch %d: reply mismatch, missing=%s extra=%s", bi, missing, extra)
        for fid, (p, _) in ids.items():
            raw = str(reply.get(fid, ""))
            new = sanitize(raw)
            if not new:
                flagged.append(p.name)
                log.debug("decide %s [%s]: no usable name (raw=%r), flagged", p.name, fid, raw)
                continue
            if new == p.stem:
                log.debug("decide %s [%s]: name unchanged (%s), skipped", p.name, fid, new)
                continue
            taken.discard(p.stem)
            final = unique(new, taken)
            taken.add(final)
            used_by_llm.append(final)
            plan.append((p, final))
            log.debug(
                "decide %s [%s]: raw=%r -> clean=%r -> final=%r%s",
                p.name, fid, raw, new, final, " (collision, suffixed)" if final != new else "",
            )

    if plan:
        plan.sort(key=lambda x: x[1])
        w = max(len(p.name) for p, _ in plan)
        print(f"\n{'OLD'.ljust(w)}  ->  NEW")
        for p, new in plan:
            print(f"{p.name.ljust(w)}  ->  {new}.pdf")
    else:
        print("\nnothing to rename.")

    if skipped_named:
        print(f"\nskipped {skipped_named} file(s) that already look renamed (use --all to include).")
    if flagged:
        print("\nflagged (no extractable text / no name returned, left unchanged):")
        for n in flagged:
            print(f"  {n}")

    def summary(renamed=0):
        log.debug(
            "summary: planned=%d renamed=%d flagged=%d skipped_named=%d claude_calls=%d cost_usd=%.4f elapsed=%.1fs",
            len(plan), renamed, len(flagged), skipped_named,
            STATS["claude_calls"], STATS["cost_usd"], time.perf_counter() - t_start,
        )

    if not plan:
        summary()
        return
    if not args.apply:
        print("\ndry run only. re-run with --apply to rename.")
        summary()
        return

    moves = []
    for p, new in plan:
        dst = p.with_name(new + ".pdf")
        if dst.exists():
            print(f"skip (target exists): {dst.name}")
            log.debug("apply: skip %s, target %s exists on disk", p.name, dst.name)
            continue
        p.rename(dst)
        moves.append({"old": p.name, "new": dst.name})
        log.debug("apply: %s -> %s", p.name, dst.name)

    runs = load_log(d)
    runs.append({"time": datetime.now().isoformat(timespec="seconds"), "moves": moves})
    (d / LOG_NAME).write_text(json.dumps(runs, indent=2))
    log.debug("apply: wrote %d move(s) to %s (%d run(s) total)", len(moves), d / LOG_NAME, len(runs))
    print(f"\nrenamed {len(moves)} file(s). undo with: {Path(sys.argv[0]).name} {d} --undo")
    summary(len(moves))


if __name__ == "__main__":
    main()
