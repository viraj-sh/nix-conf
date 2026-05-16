{
  config,
  pkgs,
  lib,
  ...
}:
{
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
  services.mailhog = {
    enable = true;

    # SMTP server port
    smtpPort = 1025;

    # Web UI + API
    uiPort = 8025;
    apiPort = 8025;

    # Store emails in RAM
    storage = "memory";

    # Replace system sendmail with MailHog
    setSendmail = true;

    # Optional extra flags
    extraArgs = [
      "-invite-jim=false"
    ];
  };

  # Optional firewall openings
  networking.firewall.allowedTCPPorts = [
    1025
    8025
  ];
}
