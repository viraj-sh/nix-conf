{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
  ];
  home.packages = with pkgs; [
    swayidle
  ];
  services.swayidle = {
    package = pkgs.swayidle;
    enable = false;
    timeouts = [
      {
        timeout = 500;
        command = "${pkgs.swaylock}/bin/swaylock";
      }
    ];
  };
}
