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
    patchelf
    antigravity
    python312
    uv
    nodejs_24
    gcc
    gemini-cli
    claude-code
    github-copilot-cli
    httptoolkit
    mongodb-compass
    mongosh
    mongodb-cli
  ];
}
