{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./modules/git.nix
    ./modules/browser.nix
    ./modules/alacritty.nix
    ./modules/nvim.nix
    ./modules/suckless.nix
    ./modules/zed.nix
  ];
  home.packages = with pkgs; [];
  home.username = "virajs-desktop";
  home.homeDirectory = lib.mkForce "/home/virajs-desktop";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
  home.sessionPath = [ "$HOME/.local/bin" ];
}
