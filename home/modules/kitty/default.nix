{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [
    ./gruvbox.nix
  ];

  home.packages = with pkgs; [
  ];
}
