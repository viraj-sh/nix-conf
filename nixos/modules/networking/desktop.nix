{
  config,
  pkgs,
  lib,
  ...
}: let
  ip = "192.168.1.104";
  hostnames = [
    "vikunja.viraj.top"
    "nginx.viraj.top"
    "metube.viraj.top"
    "mailpit.viraj.top"
    "beszel.viraj.top"
  ];
  combinedHostEntry = "${ip} " + lib.concatStringsSep " " hostnames;
in {
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
    allowedTCPPorts = [8081];
    allowedUDPPorts = [8081];
    # This extra commands block ensures multicast traffic is allowed
    extraCommands = ''
      iptables -I nixos-fw -p udp --dport 5353 -j ACCEPT
      iptables -I nixos-fw -p udp -d 224.0.0.0/4 -j ACCEPT
      iptables -I nixos-fw -p udp -s 224.0.0.0/4 -j ACCEPT
    '';
  };
  # networking.firewall = {
  #   enable = true;
  #   allowedTCPPorts = [ 8081 ];
  #   allowedUDPPorts = [ 8081 ];
  #   extraCommands = ''
  #     iptables -A nixos-fw -p udp -d 224.0.0.0/4 -j nixos-fw-accept
  #     iptables -A nixos-fw -p udp -s 224.0.0.0/4 -j nixos-fw-accept
  #   '';
  # };
  # networking.defaultGateway = "192.168.1.1";
  # networking.nameservers = [
  #   "1.1.1.1"
  #   "8.8.8.8"
  # ];
  # WOL
  networking.interfaces.enp1s0.wakeOnLan.enable = true;
}
