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
    ./modules/networking/desktop.nix
    ./modules/users/desktop.nix
    ./modules/fonts
    ./modules/flatpak
    ./modules/mount/desktop.nix
    ./modules/desktop/gnome.nix
    ./modules/desktop/niri.nix
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
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
    WAYLAND_DISPLAY = "wayland-1";
    GTK_CSD = "0";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
