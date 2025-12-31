{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/nix-settings
    ./modules/virtualization
    ./modules/boot
    ./modules/networking
    ./modules/networking/server.nix
    ./modules/users/server.nix
    ./modules/mount/server.nix
    ./modules/containers/brave
    ./modules/containers/nginx
    ./modules/containers/cloudflared
    ./modules/containers/vaultwarden
    ./modules/containers/vscode
    ./modules/containers/portainer
    ./modules/containers/nextcloud
    ./modules/containers/nexterm
    ./modules/containers/n8n
    ./modules/containers/ntfy
    ./modules/containers/navidrome
    ./modules/containers/karakeep
    ./modules/containers/vikunja
    ./modules/containers/beszel
    # ./modules/containers/tiny10
    ./modules/containers/excalidraw
    ./modules/containers/filebrowser
    ./modules/containers/expenseowl
    # ./modules/containers/intellij-idea
    ./modules/containers/metube
    ./modules/containers/jellyfin
    ./modules/containers/ollama
  ];
  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Auto Updates
  # system = {
  #   autoUpgrade = {
  #     enable = true;
  #     allowReboot = true;
  #     channel = "https://channels.nixos.org/nixos-25.05";
  #   };
  # };
  environment.sessionVariables = {
    DOCKER_HOST = null;
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
