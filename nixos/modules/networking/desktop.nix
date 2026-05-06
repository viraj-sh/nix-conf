{
  config,
  pkgs,
  lib,
  ...
}: let
  ip = "192.168.1.104";
  hostnames = [
    "vikunja.viraj.top"
  ];
  combinedHostEntry = "${ip} " + lib.concatStringsSep " " hostnames;
in {
  imports = [
  ];
  networking.extraHosts = combinedHostEntry;
  # WOL
  networking.interfaces.enp1s0.wakeOnLan.enable = true;
}
