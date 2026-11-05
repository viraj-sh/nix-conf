{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];
  services.playerctld = {
      enable = true;
      package = pkgs.playerctl;
  };
}
