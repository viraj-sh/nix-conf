{
  config,
  pkgs,
  lib,
  nixvim,
  ...
}: {
  imports = [
    nixvim.homeModules.nixvim
  ];
  home.packages = with pkgs; [
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
  };
}
