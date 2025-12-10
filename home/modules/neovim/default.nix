{
  config,
  pkgs,
  lib,
  nixvim,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
  };
}
