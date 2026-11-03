{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  environment.systemPackages = with pkgs; [
    intel-media-driver
  ];

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = [pkgs.intel-media-driver];
  hardware.alsa.enable = true;
}
