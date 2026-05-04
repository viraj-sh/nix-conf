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

  services.flatpak = {
    enable = true;
    package = pkgs.flatpak;
    packages = ["com.spotify.Client"];
  };
}
