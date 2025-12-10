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
  ];

  programs.bash = {
    enable = true;
    package = pkgs.bashInteractive;
    enableCompletion = true;
      # Add this:
    bashrcExtra = ''
      # export LD_LIBRARY_PATH=${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH
      export PATH=~/bin:$PATH
    '';
    # yazi.enableBashIntegration = true;
    # fzf.enableBashIntegration = true;
    # bashrcExtra = ""
    # Aliases go here
    shellAliases = {
      c = "clear";
      nenv = "nix-env -i";
      pictures = "cd /home/virajs/Nextcloud/Pictures";
      document = "cd /home/virajs/Nextcloud/Documents";
      music = "cd /home/virajs/NextcloudMusic";
      storage = "cd /home/virajs/Nextcloud/Storage";
      videos = "cd /home/virajs/Nextcloud/Videos";

      # Nix Package script command
      hpa = "/home/virajs/nixos-config/home/modules/scripts/try.sh home add";
      hpr = "/home/virajs/nixos-config/home/modules/scripts/try.sh home remove";
      spa = "/home/virajs/nixos-config/home/modules/scripts/try.sh system add";
      spr = "/home/virajs/nixos-config/home/modules/scripts/try.sh system remove";

      # NixOS rebuild with flake path
      ns = "sudo nixos-rebuild switch --flake /home/virajs/nixos-config#virajs";

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
    };
  };
}
