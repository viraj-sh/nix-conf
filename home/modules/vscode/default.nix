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
      nixprofile = import ./nixprofile.nix { inherit pkgs lib; };
      # work = import ./work.nix { inherit pkgs lib; };

      # Add more if needed:
      # gaming = import ./gaming.nix { inherit pkgs lib; };
      # minimal = import ./minimal.nix { inherit pkgs lib; };
    };
  };
}

