{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  services.xserver = {
    enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = ../../../config/dwm;
      };
    };
  };
  services.picom.enable = true;
}
