{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    swaylock
  ];

  # services.swaync = {
  #   enable = true;
  #   package = pkgs.swaynotificationcenter;
  #   settings = {};
  # };
}
