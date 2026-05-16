{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  environment.systemPackages = with pkgs; [
    warehouse
    flatpak
  ];
  xdg.portal.enable = true;

  services.flatpak = {
    enable = true;
    package = pkgs.flatpak;
    # packages = ["com.spotify.Client"];
  };
}
