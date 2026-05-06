{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [];

  home.packages = with pkgs; [
    yazi
    bash-preexec
    bash-completion
    bash-language-server
    curl
    sshfs
    fuzzel
    fzf
    nps
  ];

  programs.bash = {
    enable = true;
    package = pkgs.bashInteractive;
    enableCompletion = true;
    bashrcExtra = ''
      export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH
      export PATH=~/bin:$PATH
    '';
    shellAliases = {
      c = "clear";
      nenv = "nix-env -i";
      pictures = "cd /home/virajs-desktop/Nextcloud/Pictures";
      document = "cd /home/virajs-desktop/Nextcloud/Documents";
      music = "cd /home/virajs-desktop/NextcloudMusic";
      storage = "cd /home/virajs-desktop/Nextcloud/Storage";
      videos = "cd /home/virajs-desktop/Nextcloud/Videos";
      # code = "code --ozone-platform=wayland";
      code = "code 2>/dev/null";

      # Nix Package script command
      hpa = "/home/virajs-desktop/nix-conf/scripts/addpkg.sh home add";
      hpr = "/home/virajs-desktop/nix-conf/scripts/addpkg.sh home remove";
      spa = "/home/virajs-desktop/nix-conf/scripts/addpkg.sh system add";
      spr = "/home/virajs-desktop/nix-conf/scripts/addpkg.sh system remove";

      # NixOS rebuild with flake path
      ns = "sudo nixos-rebuild switch --flake /home/virajs-desktop/nix-conf#virajs-desktop";

      # Yaak
      # "yaak-app" = "XDG_DATA_DIRS=\"${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:\${XDG_DATA_DIRS}\" yaak-app";

      # Nix package search nps
      nps = "nps -e=true";

      # Docker Compose aliases
      dce = "docker-compose exec";
      dcps = "docker-compose ps";
      dcrestart = "docker-compose restart";
      dcrm = "docker-compose rm";
      dcr = "docker-compose run";
      dcstop = "docker-compose stop";
      dcupd = "docker-compose up -d";
      dcdn = "docker-compose down";
      dcstart = "docker-compose start";
      dck = "docker-compose kill";

      # Docker command aliases
      dps = "docker ps";
      dpsa = "docker ps -a";
      dils = "docker image ls";
      dirm = "docker image rm";
      dnc = "docker network create";
      dnls = "docker network ls";
      dnr = "docker network rm";
      dlo = "docker container logs";
      dpu = "docker pull";
      dr = "docker container run";
      dst = "docker container start";
      drs = "docker container restart";
      dstp = "docker container stop";
      dvls = "docker volume ls";
      dxc = "docker container exec";

      # Git aliases
      ga = "git add";
      gcm = "git commit -m";
      grao = "git remote add origin";
      gpu = "git push -u";
      gsb = "git status --short -b";
      gi = "git init";

      # Python/pip aliases
      pipi = "pip install";
      pipu = "pip install --upgrade";
      pipun = "pip uninstall";
      pipgi = "pip freeze | grep";
      pipreq = "pip freeze > requirements.txt";
      pipir = "pip install --no-cache-dir -r requirements.txt";
      pipid = "pip install --no-cache-dir -r requirements/dev.txt";
      pipib = "pip install --no-cache-dir -r requirements/base.txt";

      # Python virtual environment
      mkvenv = "python -m venv venv";
      rmvenv = "rm -rf venv";
      actvenv = "source venv/bin/activate";

      # UV aliases
      uva = "uv add";
      uvexp = "uv export --format requirements-txt --no-hashes --output-file requirements.txt --quiet";
      uvi = "uv init";
      uvinw = "uv init --no-workspace";
      uvl = "uv lock";
      uvlr = "uv lock --refresh";
      uvlu = "uv lock --upgrade";
      uvp = "uv pip";
      uvpi = "uv python install";
      uvpl = "uv python list";
      uvpp = "uv python pin";
      uvpu = "uv python uninstall";
      uvpy = "uv python";
      uvr = "uv run";
      uvrm = "uv remove";
      uvs = "uv sync";
      uvsr = "uv sync --refresh";
      uvsu = "uv sync --upgrade";
      uvtr = "uv tree";
      uvup = "uv self update";
      uvv = "uv venv";

      # systemctl aliases (non-sudo)
      sc-failed = "systemctl --failed";
      sc-list-units = "systemctl list-units";
      sc-is-active = "systemctl is-active";
      sc-status = "systemctl status";
      sc-show = "systemctl show";
      sc-help = "systemctl help";
      sc-list-unit-files = "systemctl list-unit-files";
      sc-is-enabled = "systemctl is-enabled";
      sc-list-jobs = "systemctl list-jobs";
      sc-show-environment = "systemctl show-environment";
      sc-cat = "systemctl cat";
      sc-list-timers = "systemctl list-timers";

      # systemctl aliases (with sudo)
      sc-start = "sudo systemctl start";
      sc-stop = "sudo systemctl stop";
      sc-reload = "sudo systemctl reload";
      sc-restart = "sudo systemctl restart";
      sc-try-restart = "sudo systemctl try-restart";
      sc-isolate = "sudo systemctl isolate";
      sc-kill = "sudo systemctl kill";
      sc-reset-failed = "sudo systemctl reset-failed";
      sc-enable = "sudo systemctl enable";
      sc-disable = "sudo systemctl disable";
      sc-reenable = "sudo systemctl reenable";
      sc-preset = "sudo systemctl preset";
      sc-mask = "sudo systemctl mask";
      sc-unmask = "sudo systemctl unmask";
      sc-link = "sudo systemctl link";
      sc-load = "sudo systemctl load";
      sc-cancel = "sudo systemctl cancel";
      sc-set-environment = "sudo systemctl set-environment";
      sc-unset-environment = "sudo systemctl unset-environment";
      sc-edit = "sudo systemctl edit";
      sc-enable-now = "sudo systemctl enable --now";
      sc-disable-now = "sudo systemctl disable --now";
      sc-mask-now = "sudo systemctl mask --now";

      # React Native aliases
      rn = "react-native";
      rns = "react-native start";
      rnlink = "react-native link";
      rnland = "react-native log-android";
      rnlios = "react-native log-ios";
      rnand = "react-native run-android";
      rnios = "react-native run-ios";

      # iPhone simulators
      rnios4s = "react-native run-ios --simulator \"iPhone 4s\"";
      rnios5 = "react-native run-ios --simulator \"iPhone 5\"";
      rnios5s = "react-native run-ios --simulator \"iPhone 5s\"";
      rnios6 = "react-native run-ios --simulator \"iPhone 6\"";
      rnios6s = "react-native run-ios --simulator \"iPhone 6s\"";
      rnios6p = "react-native run-ios --simulator \"iPhone 6 Plus\"";
      rnios6sp = "react-native run-ios --simulator \"iPhone 6s Plus\"";
      rnios7 = "react-native run-ios --simulator \"iPhone 7\"";
      rnios7p = "react-native run-ios --simulator \"iPhone 7 Plus\"";
      rnios8 = "react-native run-ios --simulator \"iPhone 8\"";
      rnios8p = "react-native run-ios --simulator \"iPhone 8 Plus\"";
      rniosse = "react-native run-ios --simulator \"iPhone SE\"";
      rniosx = "react-native run-ios --simulator \"iPhone X\"";
      rniosxs = "react-native run-ios --simulator \"iPhone Xs\"";
      rniosxsm = "react-native run-ios --simulator \"iPhone Xs Max\"";
      rniosxr = "react-native run-ios --simulator \"iPhone Xʀ\"";
      rnios11 = "react-native run-ios --simulator \"iPhone 11\"";
      rnios11p = "react-native run-ios --simulator \"iPhone 11 Pro\"";
      rnios11pm = "react-native run-ios --simulator \"iPhone 11 Pro Max\"";
      rnios12 = "react-native run-ios --simulator \"iPhone 12\"";
      rnios12m = "react-native run-ios --simulator \"iPhone 12 mini\"";
      rnios12p = "react-native run-ios --simulator \"iPhone 12 Pro\"";
      rnios12pm = "react-native run-ios --simulator \"iPhone 12 Pro Max\"";
      rnios13 = "react-native run-ios --simulator \"iPhone 13\"";
      rnios13m = "react-native run-ios --simulator \"iPhone 13 mini\"";
      rnios13p = "react-native run-ios --simulator \"iPhone 13 Pro\"";
      rnios13pm = "react-native run-ios --simulator \"iPhone 13 Pro Max\"";
      rnios14 = "react-native run-ios --simulator \"iPhone 14\"";
      rnios14pl = "react-native run-ios --simulator \"iPhone 14 Plus\"";
      rnios14p = "react-native run-ios --simulator \"iPhone 14 Pro\"";
      rnios14pm = "react-native run-ios --simulator \"iPhone 14 Pro Max\"";
      rnios15 = "react-native run-ios --simulator \"iPhone 15\"";
      rnios15pl = "react-native run-ios --simulator \"iPhone 15 Plus\"";
      rnios15p = "react-native run-ios --simulator \"iPhone 15 Pro\"";
      rnios15pm = "react-native run-ios --simulator \"iPhone 15 Pro Max\"";

      # iPad simulators
      rnipad2 = "react-native run-ios --simulator \"iPad 2\"";
      rnipad5 = "react-native run-ios --simulator \"iPad (5th generation)\"";
      rnipad6 = "react-native run-ios --simulator \"iPad (6th generation)\"";
      rnipadr = "react-native run-ios --simulator \"iPad Retina\"";
      rnipada = "react-native run-ios --simulator \"iPad Air\"";
      rnipada2 = "react-native run-ios --simulator \"iPad Air 2\"";
      rnipada3 = "react-native run-ios --simulator \"iPad Air (3rd generation)\"";
      rnipadm2 = "react-native run-ios --simulator \"iPad mini 2\"";
      rnipadm3 = "react-native run-ios --simulator \"iPad mini 3\"";
      rnipadm4 = "react-native run-ios --simulator \"iPad mini 4\"";
      rnipadm5 = "react-native run-ios --simulator \"iPad mini (5th generation)\"";
      rnipadp9 = "react-native run-ios --simulator \"iPad Pro (9.7-inch)\"";
      rnipadp12 = "react-native run-ios --simulator \"iPad Pro (12.9-inch)\"";
      rnipadp122 = "react-native run-ios --simulator \"iPad Pro (12.9-inch) (2nd generation)\"";
      rnipadp10 = "react-native run-ios --simulator \"iPad Pro (10.5-inch)\"";
      rnipad11 = "react-native run-ios --simulator \"iPad Pro (11-inch)\"";
      rnipad123 = "react-native run-ios --simulator \"iPad Pro (12.9-inch) (3rd generation)\"";

      # Apple TV simulators
      rnatv = "react-native run-ios --simulator \"Apple TV\"";
      rnatv4k = "react-native run-ios --simulator \"Apple TV 4K\"";
      rnatv4k1080 = "react-native run-ios --simulator \"Apple TV 4K (at 1080p)\"";

      # Apple Watch simulators
      rnaw38 = "react-native run-ios --simulator \"Apple Watch - 38mm\"";
      rnaw42 = "react-native run-ios --simulator \"Apple Watch - 42mm\"";
      rnaws238 = "react-native run-ios --simulator \"Apple Watch Series 2 - 38mm\"";
      rnaws242 = "react-native run-ios --simulator \"Apple Watch Series 2 - 42mm\"";
      rnaws338 = "react-native run-ios --simulator \"Apple Watch Series 3 - 38mm\"";
      rnaws342 = "react-native run-ios --simulator \"Apple Watch Series 3 - 42mm\"";
      rnaws440 = "react-native run-ios --simulator \"Apple Watch Series 4 - 40mm\"";
      rnaws444 = "react-native run-ios --simulator \"Apple Watch Series 4 - 44mm\"";

      # Python aliases
      py = "python3";
      pyfind = "find . -name '*.py' -type f";
      pyclean = "find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete";
      pygrep = "grep --include='*.py' -r";
      pyuserpaths = "python -c 'import site; print(\":\".join(site.getusersitepackages() for py in [2,3]))' | xargs echo export PYTHONPATH=\\$PYTHONPATH:";
      pyserver = "python -m http.server";

      # pre-commit aliases
      prc = "pre-commit";
      prcau = "pre-commit autoupdate";
      prcr = "pre-commit run";
      prcra = "pre-commit run --all-files";
      prcrf = "pre-commit run --files";

      # Postgres aliases
      startpost = "pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start";
      stoppost = "pg_ctl -D /usr/local/var/postgres stop -s -m fast";
      restartpost = "stoppost && sleep 1 && startpost";
      reloadpost = "pg_ctl reload -D /usr/local/var/postgres -s";
      statuspost = "pg_ctl status -D /usr/local/var/postgres -s";

      # NPM aliases
      npmg = "npm i -g";
      npmS = "npm i -S";
      npmD = "npm i -D";
      npmF = "npm i -f";
      npmE = "PATH=\"$(npm bin):$PATH\"";
      npmO = "npm outdated";
      npmU = "npm update";
      npmV = "npm -v";
      npmL = "npm list";
      npmL0 = "npm ls --depth=0";
      npmst = "npm start";
      npmt = "npm test";
      npmR = "npm run";
      npmP = "npm publish";
      npmI = "npm init";
      npmi = "npm info";
      npmSe = "npm search";
      npmrd = "npm run dev";
      npmrb = "npm run build";

      # History aliases
      h = "history";
      hl = "history | less";
      hs = "history | grep";
      hsi = "history | grep -i";
    };
  };
}
