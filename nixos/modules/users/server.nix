{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  users.users.virajs-server.group = "virajs-server";
  users.groups.virajs-server = {};
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.virajs-server = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "libvirtd" "kvm"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

}
