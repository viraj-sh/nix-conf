{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  environment.systemPackages = with pkgs; [
  ];

  users.groups."virajs-laptop" = {};
  users.groups.docker = {};

  users.users."virajs-laptop" = {
    isNormalUser = true;
    group = "virajs-laptop";

    extraGroups = ["wheel" "docker" "libvirtd" "kvm"];
    packages = with pkgs; [
    ];
  };
}
