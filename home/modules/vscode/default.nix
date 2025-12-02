{ config, pkgs, lib, ... }:

let
  dir = ./.;
  files =
    builtins.filter
      (file: lib.hasSuffix ".nix" file && file != "default.nix")
      (builtins.attrNames (builtins.readDir dir));
  profiles =
    builtins.listToAttrs (map
      (file: {
        name = lib.removeSuffix ".nix" file;
        value = import (dir + "/${file}") { inherit pkgs lib; };
      })
      files);
in
{
  home.packages = with pkgs; [
    vscode
  ];  
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false;
    profiles = profiles;
  };
}
