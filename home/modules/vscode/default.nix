{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    vscode
    direnv
    alejandra
    patchelf
    antigravity
    python312
    uv
    nodejs_24
    gcc
    gemini-cli
    github-copilot-cli
    httptoolkit
  ];
}
