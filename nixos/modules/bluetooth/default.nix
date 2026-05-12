{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  environment.systemPackages = with pkgs; [
  ];

  hardware.bluetooth.enable = true;
}
