{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    xdg-desktop-portal
    gtk2
    gtk3
    gtk4
  ];

  # Enable Wayland + Niri
  programs.niri = {
    enable = true;
  };
  services.displayManager.defaultSession = "niri";

  # Input + graphics
  services.libinput.enable = true;
  hardware.graphics.enable = true;

  services = {
    pipewire = {
      enable = lib.mkForce true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
      package = pkgs.pipewire;
      wireplumber.enable = true;
    };
    xserver = {
      enable = true;
    };
  };
  programs.xwayland.enable = true;
  programs.xwayland.package = pkgs.xwayland-satellite;

  security = {
    polkit = {
      enable = true;
      package = pkgs.polkit;
      debug = true;
    };
  };

  hardware.alsa.enable = true;
  hardware.bluetooth.enable = true;
  xdg.portal.enable = true;
}
