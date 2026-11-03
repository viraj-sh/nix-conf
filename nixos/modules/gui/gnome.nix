{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
