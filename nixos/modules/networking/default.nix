{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [
  ];
  networking.wireless.enable = false;
  networking.wireless.iwd.enable = false;
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
}
