{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./modules/nix-settings
    ./modules/hardware
    ./modules/audio
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
    ./modules/bluetooth
  ];
  environment.systemPackages = with pkgs; [
    dconf
    gsettings-desktop-schemas
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
    GSETTINGS_SCHEMA_DIR =
      "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas"
      + ":${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
  };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  programs.dconf.enable = true;
  programs.nix-ld.enable = true;
  services.postgresql.enable = true;
  services.postgresql.settings = {
    listen_addresses = "localhost";
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
