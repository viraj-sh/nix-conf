{
  config,
  pkgs,
  lib,
  ...
}:
let
in
{
  imports = [
  ];
  networking.wireless.enable = true;
  networking.wireless.iwd.enable = false;
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
}
