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
    fastfetch
  ];
  programs.fastfetch = {
    enable = true;
    settings = {};
  };
}
