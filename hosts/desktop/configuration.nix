{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixos/desktop.nix
    ./stylix.nix
  ];
  environment.systemPackages = with pkgs; [
    vim
    wget
    nettools
    bash
    btop
    lsof
    openssl
    tree
  ];
  system.stateVersion = "25.11";
}
