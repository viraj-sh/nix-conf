{...}: {
  imports = [
    ./modules/nix_settings.nix
    ./modules/hardware.nix
    ./modules/boot.nix
    ./modules/networking
    ./modules/networking/desktop.nix
    ./modules/users/desktop.nix
    ./modules/gui/gnome.nix
    ./modules/gui/dwm.nix
    ./modules/audio.nix
    ./modules/security.nix
    ./modules/bluetooth.nix
    ./modules/fonts.nix
    ./modules/clipboard.nix
    ./modules/virtualization.nix
    ./modules/flatpak.nix
    ./modules/mount/desktop.nix
    ./modules/swap/desktop.nix
    ./modules/stylix.nix
    ./modules/appimage.nix
  ];
  # Allow unfree
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-41.10.7"
    "intel-media-sdk-23.2.2"
    "electron-42.11.18"
  ];

  programs.nix-ld.enable = true;
  programs.dconf.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
