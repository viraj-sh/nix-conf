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
    ./modules/docker
    ./modules/alacritty
    ./modules/vscode
    ./modules/waybar
    ./modules/api-client
    ./modules/bitwarden
    ./modules/discord
    ./modules/gtk
    ./modules/kitty
    ./modules/wlogout
    ./modules/fuzzel
    ./modules/swaylock
    ./modules/niri
    ./modules/polkit

  ];
  home.username = "virajs-desktop";
  home.homeDirectory = lib.mkForce "/home/virajs-desktop";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
