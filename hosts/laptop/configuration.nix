{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixos/laptop.nix
    ./stylix.nix
  ];
  hardware.asahi.enable = true;
  # hardware.asahi.useExperimentalGPUDriver = true;
  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
  hardware.asahi.extractPeripheralFirmware = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.systemd-boot.configurationLimit = 10;

  system.stateVersion = "25.11";
}
