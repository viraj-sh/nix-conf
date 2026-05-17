{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/git
    ./modules/nextcloud
    ./modules/api-client
    ./modules/browsers
    ./modules/docker
    ./modules/docs
    ./modules/fastfetch
    ./modules/filemanager
    ./modules/fuzzel
    ./modules/gtk
    ./modules/kitty
    ./modules/neovim
    ./modules/polkit
    ./modules/rice
    ./modules/shell
    # ./modules/vscode
  ];
  home.username = "virajs-laptop";
  home.homeDirectory = lib.mkForce "/home/virajs-laptop";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
