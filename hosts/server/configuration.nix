{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./stylix.nix
    ./nvf.nix
    ../../nixos/server.nix
  ];
  # boot.loader.systemd-boot.enable = true;
  # boot.kernel.sysctl."vm.swappiness" = 60;
  # programs.virt-manager.enable = true;
  # programs.virt-manager.package = pkgs.virt-manager;
  # programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    neovim
    wget
    nettools
    bash
    ripgrep
    btop
    lsof
    openssl
    iproute2
    gcc
    tree
    oh-my-zsh
    fzf
    zoxide
    dmidecode
    pciutils
    lshw
  ];
  system.stateVersion = "25.11";
}
