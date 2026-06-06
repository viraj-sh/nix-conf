{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/git
    ./modules/fastfetch
    # ./modules/shell
    # ./modules/neovim
    ./modules/docker
  ];
  home.username = "virajs-server";
  home.homeDirectory = lib.mkForce "/home/virajs-server";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
