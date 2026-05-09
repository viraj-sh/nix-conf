{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    # obs-studio
    # obs-studio-plugins.obs-teleport
    # wf-recorder
    # spotdl
  ];
  programs.obs-studio = {
    package = pkgs.obs-studio;
    enable = true;
    plugins = [
      pkgs.obs-studio-plugins.obs-teleport
    ];
  };
}
