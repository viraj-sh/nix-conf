{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  environment.systemPackages = with pkgs; [
    bluetuith
  ];

  hardware.bluetooth.enable = true;
}
