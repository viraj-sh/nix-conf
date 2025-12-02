{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];
  homebrew = {
  enable = true;
  user = "virajs";
  casks = [
    "pearcleaner"
  ]
  onActivation = {
    clearnup = "uninstall";
    upgrade = "false";
    autoUpdate = "false";
  }
  global = {
    autoUpdate = false;
    brewfile = false;
  }
  
  }
}
