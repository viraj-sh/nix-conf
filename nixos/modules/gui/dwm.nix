{pkgs, ...}: {
  imports = [];
  environment.systemPackages = [pkgs.fastcompmgr pkgs.xdg-desktop-portal];
  services.xserver = {
    enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = ../../../config/dwm;
      };
    };
  };
  # services.picom.enable = true;
  systemd.user.services.fastcompmgr = {
    description = "fastcompmgr compositor";
    wantedBy = ["default.target"];
    serviceConfig = {
      ExecStart = "${pkgs.fastcompmgr}/bin/fastcompmgr -r 0 -o 0 -c -C";
      Restart = "on-failure";
    };
  };
  programs.slock = {
    enable = true;
    package = pkgs.slock;
  };
}
