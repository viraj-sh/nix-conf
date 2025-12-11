{pkgs, lib, ...}: {
  imports = [
    ./modules/git
    ./modules/fastfetch
    # ./modules/shell
    # ./modules/neovim
    ./modules/docker
  ];
  home.username = "virajs-server";
  home.homeDirectory = lib.mkForce "/home/virajs-server";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
