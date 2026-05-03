{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/git
    ./modules/fastfetch
    ./modules/browsers
    ./modules/nextcloud
    ./modules/shell
    # ./modules/neovim
    ./modules/docker
    ./modules/alacritty
    ./modules/vscode

  ];
  home.username = "virajs-desktop";
  home.homeDirectory = lib.mkForce "/home/virajs-desktop";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
