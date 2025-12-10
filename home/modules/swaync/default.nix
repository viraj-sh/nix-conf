{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];

  services.swaync = {
    enable = true;
    package = pkgs.swaynotificationcenter;
    settings = {};
  };
}
