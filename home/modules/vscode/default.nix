{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    vscode
    sqlite
    # androidsdk
    # android-studio
    # android-tools
    github-cli

    sqlitebrowser
    dbeaver-bin
    # pgadmin4
    docker-buildx
    pgadmin4-desktopmode
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
    redis
    redisinsight
  ];
}
