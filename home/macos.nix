{pkgs, ...}: {
  imports = [
    ./modules/git
    ./modules/kitty
    ./modules/alacritty
    ./modules/fastfetch
    ./modules/discord
    # ./modules/vscode
    # ./modules/shell
    # ./modules/browsers
    ./modules/api-client
    #./modules/neovim
    ./modules/docker
  ];
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
