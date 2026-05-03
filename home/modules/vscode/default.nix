{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [
    pkgs.vscode
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false;

    };
}
