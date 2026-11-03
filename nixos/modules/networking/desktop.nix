{
  config,
  pkgs,
  lib,
  ...
}:
let
  ip = "192.168.1.104";
  hostnames = [];
  combinedHostEntry = "${ip} " + lib.concatStringsSep " " hostnames;
in
{
  imports = [
  ];
  networking.extraHosts = combinedHostEntry;
  networking.hostName = "virajs-desktop";

  networking.interfaces.enp1s0.ipv4.addresses = [
    {
      address = "192.168.1.103";
      prefixLength = 24;
    }
  ];
  networking.firewall = {
    enable = true;
  };

}
