{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  environment.systemPackages = with pkgs; [
  ];
  services.minecraft-server.enable = true;
  services.minecraft-server.dataDir = "/home/virajs-desktop/Nextcloud/Storage/minecraft";
  services.minecraft-server.eula = true;
  services.minecraft-server.jvmOpts = "-Xmx2048M -Xms2048M";
  services.minecraft-server.openFirewall = true;
  services.minecraft-server.declarative = true;
  services.minecraft-server.serverProperties = {
  server-port = 43000;
  difficulty = 3;
  gamemode = 1;
  max-players = 5;
  motd = "NixOS Minecraft server!";
  };

}
