{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];

  programs.kitty = {
    themeFile = "everforest_dark_hard";
  };
}
