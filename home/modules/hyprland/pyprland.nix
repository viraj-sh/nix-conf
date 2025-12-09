{ config, pkgs, lib, ... }:
let
in
{
  imports = [];

  home.packages = with pkgs; [

  ];


  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = ["scratchpads","expose"]

    [scratchpads.term]
    animation = "fromTop"
    command = "kitty --class kitty-dropterm"
    class = "kitty-dropterm"
    size = "75% 60%"
    max_size = "1920px 100%"
    margin = 50
    [scratchpads.altterm]
    animation = "fromTop"
    command = "alacritty --class AlacrittyDropTerm -e ssh virajs@192.168.1.104"
    class = "AlacrittyDropTerm"
    size = "75% 60%"
    max_size = "1920px 100%"
    margin = 50

    [expose]
    include_special = false
  '';

  

}
