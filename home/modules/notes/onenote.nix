{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    logseq
    obsidian
    p3x-onenote
  ];
}
