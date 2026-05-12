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

  services = {
    xserver = {
      enable = true;
    };
  };
  programs.xwayland.enable = true;
  programs.xwayland.package = pkgs.xwayland-satellite;

  xdg.portal.enable = true;
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
