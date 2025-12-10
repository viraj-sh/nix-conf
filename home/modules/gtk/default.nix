{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [];

  home.packages = with pkgs; [
  ];

  gtk = {
    enable = true;
    theme = {
      name = lib.mkForce "Everforest-Dark-BL";
      package = lib.mkForce pkgs.everforest-gtk-theme;
    };
    iconTheme = {
      name = lib.mkForce "Everforest-Dark";
      package = lib.mkForce pkgs.everforest-gtk-theme;
    };
  };
  qt = {
    enable = true;
    platformTheme = {
      name = lib.mkForce "gtk";
    };
    style = {
      name = lib.mkForce "gtk2";
    };
  };
}
