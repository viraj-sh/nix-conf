{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  # Hostname
  networking.hostName = "virajs-server";

  networking.interfaces.enp3s0.ipv4.addresses = [
    {
      address = "192.168.1.104";
      prefixLength = 24;
    }
  ];

  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = ["1.1.1.1" "8.8.8.8"];
  networking.extraHosts = ''
    127.0.0.1 server.vaultwarden
    127.0.0.1 server.coder
    127.0.0.1 server.uptimekuma
    127.0.0.1 server.homepage
    127.0.0.1 server.portainer
    127.0.0.1 server.nexterm
    127.0.0.1 server.nextcloud
    127.0.0.1 server.beszel
    127.0.0.1 server.jupyterhub
    127.0.0.1 server.mediacms
    127.0.0.1 server.ntfy
    127.0.0.1 server.ariang
  '';
  networking.interfaces.enp3s0.wakeOnLan.enable = true;
}
