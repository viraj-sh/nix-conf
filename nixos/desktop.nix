{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./modules/nix_settings.nix
    ./modules/hardware.nix
    ./modules/boot.nix
    ./modules/networking
    ./modules/networking/desktop.nix
    ./modules/users/desktop.nix
    ./modules/gui/gnome.nix
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
