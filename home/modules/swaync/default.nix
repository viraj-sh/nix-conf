{
  config,
  pkgs,
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
    settings = {};
  };
}
