{
  config,
  pkgs,
  lib,
  imports,
  ...
}: let
in {
  imports = [];
  home = {
    username = "virajs";
    homeDirectory = "/Users/virajs";
    stateVersion = "25.05";
    file = {};
    sessionVariables = {};
  };
  programs.home-manager.enable = true;
  programs.nix-index.enable = true;
  programs.nix-index.enableBashIntegration = true;
}
