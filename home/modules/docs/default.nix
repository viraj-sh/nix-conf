{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    obsidian
    p3x-onenote
    libreoffice
  ];
}
