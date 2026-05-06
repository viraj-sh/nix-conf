{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    pcmanfm
    kdePackages.filelight
  ];
}
