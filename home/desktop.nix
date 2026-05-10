{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./modules/git
    ./modules/fastfetch
    ./modules/browsers
    # ./modules/browsers/chromium
    ./modules/media
    ./modules/nextcloud
    ./modules/shell
    ./modules/neovim
    ./modules/docker
    ./modules/alacritty
    ./modules/vscode
    ./modules/waybar
    ./modules/api-client
    ./modules/appEntries
    ./modules/bitwarden
    ./modules/discord
    ./modules/gtk
    ./modules/kitty
    ./modules/wlogout
    ./modules/fuzzel
    ./modules/swaylock
    ./modules/swayidle
    ./modules/swaybg
    ./modules/swaync
    ./modules/niri
    ./modules/polkit
    ./modules/cliphist
    ./modules/ocr
    ./modules/bluetooth
    ./modules/sound
    ./modules/cursor
    ./modules/swayidle
    ./modules/hyprpicker
    ./modules/keyboard
    ./modules/filemanager
    ./modules/rice
    ./modules/spotify
    ./modules/docs
  ];
  home.packages = with pkgs; [
    jq
    ntfy-sh
  ];
  home.username = "virajs-desktop";
  home.homeDirectory = lib.mkForce "/home/virajs-desktop";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
