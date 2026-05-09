{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome_5
    font-awesome
  ];
}
