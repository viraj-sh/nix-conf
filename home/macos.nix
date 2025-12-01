{pkgs, ...}: {
  imports = [
    ./modules/git
    ./modules/kitty
    ./modules/fastfetch
    ./modules/vscode
  ];
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
