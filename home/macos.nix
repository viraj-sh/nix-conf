{pkgs, ...}: {
  imports = [
    ./modules/git
    ./modules/kitty
  ];
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
