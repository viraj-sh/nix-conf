{pkgs, ...}: {
  imports = [
    ./modules/git
    ./modules/kitty
    ./modules/alacritty
    ./modules/fastfetch
    ./modules/discord
    ./modules/vscode
    ./modules/shell
    ./modules/browsers
  ];
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
