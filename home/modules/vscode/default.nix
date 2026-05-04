{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    vscode
    direnv
    alejandra
  ];
}
