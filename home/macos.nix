{pkgs, ...}: {
  imports = [./modules/git];
  home.packages = with pkgs; [
    git-credential-manager
  ];
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
