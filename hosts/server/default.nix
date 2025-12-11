{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    # ./hardware-configuration.nix
    ./configuration.nix
  ];
  home.packages = with pkgs; [
  ];
}
