{
  config,
  pkgs,
  lib,
  ...
}:
let
in
{
  imports = [ ];

  home.packages = with pkgs; [
  ];

  #  gtk = {
  #    enable = true;
  #    theme = {
  #      name = "Everforest-Dark-BL";
  #      package = pkgs.everforest-gtk-theme;
  #    };
  #    iconTheme = {
  #      name = "Everforest-Dark";
  #      package = pkgs.everforest-gtk-theme;
  #    };
  #  };
  #  qt = {
  #    enable = true;
  #    platformTheme = {
  #      name = "gtk";
  #    };
  #    style = {
  #      name = "gtk2";
  #    };
  #  };
}
