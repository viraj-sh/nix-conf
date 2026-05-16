{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixos/laptop.nix
  ];

  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
  hardware.asahi.extractPeripheralFirmware = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.virajs-laptop = {
  #   isNormalUser = true;
  #   extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     tree
  #     neovim
  #     vim
  #     git
  #   ];
  # };

  environment.systemPackages = with pkgs; [
    vim
    wget
    nettools
    bash
    btop
    lsof
    openssl
    tree
  ];

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.11";
}
