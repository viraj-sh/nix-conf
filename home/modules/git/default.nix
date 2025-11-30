{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [
    ./git_main.nix
  ];

  home.packages = with pkgs; [
  ];
}
