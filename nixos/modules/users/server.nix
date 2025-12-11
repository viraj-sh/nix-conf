{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.virajs-server = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "libvirtd" "kvm"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };
}
