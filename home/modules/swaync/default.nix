{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    libnotify
  ];

  services.swaync = {
    enable = true;
    package = pkgs.swaynotificationcenter;
  };
  xdg.configFile."swaync/style.css".source = lib.mkForce ./style.css;
  xdg.configFile."swaync/config.json".source = lib.mkForce ./config.json;
}
