{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [
  ];

  home.packages = with pkgs; [
    discord
  ];
  programs.discord = {
    enable = true;
    settings = {};
  };
}
