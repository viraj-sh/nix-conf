{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/nix-settings
    ./modules/audio
    ./modules/virtualization
    ./modules/users/laptop.nix
    ./modules/networking
    ./modules/networking/laptop.nix
    ./modules/bluetooth
    ./modules/database
    ./modules/fonts
    ./modules/security
    ./modules/desktop/kde.nix
  ];
  environment.systemPackages = with pkgs; [
  ];
  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
