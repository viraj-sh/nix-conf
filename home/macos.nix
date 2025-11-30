{pkgs, ...}: {
  imports = [./modules/git];
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
