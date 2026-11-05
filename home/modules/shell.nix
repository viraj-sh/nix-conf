{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [];

  home.packages = with pkgs; [
    bash-preexec
    bash-completion
    bash-language-server
  ];

  programs.bash = {
    enable = true;
    package = pkgs.bashInteractive;
    enableCompletion = true;
    initExtra = ''
      export PS1='\[\e[1;32m\][\u:\w]\$ \[\e[0m\]'
    '';
    bashrcExtra = ''
      export PATH=~/bin:$PATH
    '';
    shellAliases = {
      c = "clear";
      nenv = "nix-env -i";

      # NixOS rebuild with flake path
      ns = "sudo nixos-rebuild switch --flake /home/virajs-desktop/nix-conf#virajs-desktop";

      # Suckless nix develop
      nds = "nix develop /home/virajs-desktop/nix-conf#suckless";
    };
  };
}
