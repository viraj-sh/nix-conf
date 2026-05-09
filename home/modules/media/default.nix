{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
  ];
  home.packages = with pkgs; [
    obs-studio
    obs-studio-plugins.obs-teleport
    wf-recorder
    spotdl

  ];
}
