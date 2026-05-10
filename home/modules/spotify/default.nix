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
    spotify
    # spotify-cli-linux
    # ncspot
    kew
    cava
  ];
}
