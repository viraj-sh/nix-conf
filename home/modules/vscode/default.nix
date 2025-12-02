{
  config,
  pkgs,
  ...
}: let
in {
  programs.vscode = {
    enable = false;
  };
}
