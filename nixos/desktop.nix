{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/nix-settings
    ./modules/virtualization
    ./modules/boot
    ./modules/networking
    ./modules/networking/desktop.nix
    ./modules/users/desktop.nix
    ./modules/mount/desktop.nix
    ./modules/desktop/gnome.nix
    ./modules/containers/portainer
    ./modules/containers/ollama
  ];
  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Auto Updates
  # system = {
  #   autoUpgrade = {
  #     enable = true;
  #     allowReboot = true;
  #     channel = "https://channels.nixos.org/nixos-25.05";
  #   };
  # };
  environment.sessionVariables = {
    DOCKER_HOST = null;
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
