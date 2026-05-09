{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [
    ./hypridle.nix
    ./hyprland.nix
    ./pyprland.nix
    ./hyprpaper.nix
    ./hyprpolkit.nix
  ];

  home.packages = with pkgs; [
  ];
}
