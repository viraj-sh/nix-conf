{pkgs, ...}: {
  imports = [
    ./modules/git
    ./modules/kitty
    ./modules/fastfetch
    ./modules/discord
    ./modules/vscode
  ];
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
