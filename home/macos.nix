{pkgs, ...}: {
  imports = [
    ./modules/git
    ./modules/kitty
    ./modules/fastfetch
    ./modules/vscode
    ./modules/discord
  ];
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
