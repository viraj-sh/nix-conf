{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  environment.systemPackages = with pkgs; [
  ];
  services = {
    xserver = {
      enable = true;
    };
  };
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.plasma6.enableQt5Integration = true;
  services.desktopManager.plasma6.notoPackage = pkgs.noto-fonts;
  # services.displayManager.sddm.package = pkgs.kdePackages.sddm;
  services.displayManager.sddm.enable = true;
}
