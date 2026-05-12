{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  environment.systemPackages = with pkgs; [
  ];
  security = {
    polkit = {
      enable = true;
      package = pkgs.polkit;
      debug = true;
    };
  };
}
