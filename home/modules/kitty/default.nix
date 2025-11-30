{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [
    ./everforest_dark_hard.nix
  ];

  home.packages = with pkgs; [
  ];
}
