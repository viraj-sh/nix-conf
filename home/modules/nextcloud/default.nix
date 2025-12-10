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
  services = {
    nextcloud-client = {
      enable = true;
      startInBackground = true;
      package = pkgs.nextcloud-client;
    };
  };
}
