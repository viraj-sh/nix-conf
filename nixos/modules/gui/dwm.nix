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
  programs.slock = {
      enable = true;
      package = pkgs.slock;
  };
  # services.xserver.displayManager.setupCommands = ''
  #   ${pkgs.xrandr}/bin/xrandr --output HDMI-1 --primary --auto --output eDP-1 --auto --right-of HDMI-1
  # '';
}
