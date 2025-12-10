{ config, pkgs, lib, ... }:

{
  home.packages = [
    pkgs.vscode
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false;

    profiles = {
      # Add your profiles manually here:
      python = import ./python.nix { inherit pkgs lib; };
      web-dev = import ./web-dev.nix { inherit pkgs lib; };
      nix = import ./nix.nix { inherit pkgs lib; };
    };
  };
}

