{
  config,
  pkgs,
  lib,
  ...
}: let
  ip = "192.168.1.104";
  hostnames = [
    "server.hedgedoc"
    "vikunja.viraj.top"
    "brave.viraj.top"
    "portainer.viraj.top"
    "beszel.viraj.top"
    "metube.viraj.top"
    "n8n.viraj.top"
    "nextcloud.viraj.top"
    "vscode.viraj.top"
    "bitwarden.viraj.top"
    "nginx.viraj.top"
    "librechat.viraj.top"
    "ollama.viraj.top"
  ];
  combinedHostEntry = "${ip} " + lib.concatStringsSep " " hostnames;  
in {
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
  # networking.extraHosts = ''
  #   192.168.1.104 bitwarden.viraj.top
  #   192.168.1.104 ollama.viraj.top
  # '';
  networking.extraHosts = combinedHostEntry;

  networking.interfaces.enp3s0.wakeOnLan.enable = true;
}
