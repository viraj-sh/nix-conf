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
    192.168.1.104 bitwarden.viraj.top
  '';
  networking.interfaces.enp3s0.wakeOnLan.enable = true;
}
