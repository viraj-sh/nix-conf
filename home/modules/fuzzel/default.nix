{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [
    
  ];

  home.packages = with pkgs; [
    pkgs.fuzzel
  ];

}
