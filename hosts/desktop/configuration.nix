{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../nixos/desktop.nix
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
  system.stateVersion = "26.05";
}
