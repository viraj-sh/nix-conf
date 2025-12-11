{pkgs, ...}: {
  imports = [
    ./modules/git
    ./modules/fastfetch
    # ./modules/shell
    ./modules/neovim
    ./modules/docker
  ];
  home.username = "virajs-server";
  home.homeDirectory = "/home/virajs-server";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
