{ config, pkgs, ... }:
{
  imports = [

  ];
  home.packages = with pkgs; [

  ];

  services.hypridle = {

    enable = true;
    package = pkgs.hypridle;
    settings = {
      general = {
      lock_cmd = "hyprlock";
    };

    listener = [
      {
        timeout = 500;
        on-timeout = "hyprlock";
      }
    ];
    };
  };






}
