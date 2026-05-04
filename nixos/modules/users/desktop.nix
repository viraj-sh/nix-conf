{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  # users.users."virajs-desktop".group = "virajs-desktop";
  users.groups."virajs-desktop" = {};
  users.groups.docker = {};
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."virajs-desktop" = {
    isNormalUser = true;
    group = "virajs-desktop";

    extraGroups = ["wheel" "docker" "libvirtd" "kvm"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };
}
