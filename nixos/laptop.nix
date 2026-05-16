{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/users/laptop.nix
    ./modules/networking/laptop.nix
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
