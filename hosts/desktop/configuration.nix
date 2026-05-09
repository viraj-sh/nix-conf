{
  config,
  lib,
  pkgs,
  unstable,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./stylix.nix
    #    ./secrets.nix
    #    ./nvf.nix
    ../../nixos/desktop.nix
  ];
  # boot.loader.systemd-boot.enable = true;
  # boot.kernel.sysctl."vm.swappiness" = 60;
  # programs.virt-manager.enable = true;
  # programs.virt-manager.package = pkgs.virt-manager;
  # programs.zsh.enable = true;
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
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
