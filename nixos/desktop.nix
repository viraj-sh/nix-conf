{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/nix_settings.nix
    ./modules/hardware.nix
    ./modules/boot.nix
    ./modules/networking
    ./modules/networking/desktop.nix
    ./modules/users/desktop.nix
    ./modules/gui/gnome.nix
    ./modules/gui/dwm.nix
    ./modules/audio.nix
    ./modules/security.nix
    ./modules/bluetooth.nix
    ./modules/fonts.nix
    ./modules/clipboard.nix
    ./modules/virtualization.nix
  ];
  environment.systemPackages = with pkgs; [];
  # Allow unfree
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [];

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
