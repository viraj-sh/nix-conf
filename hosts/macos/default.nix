{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.vim
    pkgs.git
    pkgs.neovim
    pkgs.fastfetch
    pkgs.brave
  ];

  nix.settings.experimental-features = "nix-command flakes";

  system.configurationRevision = null;
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
}

