{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    vscode
    jetbrains.pycharm
    flutter
    mysql84
    sqlite
    bento4
    act
    # androidsdk
    # android-studio
    android-tools
    github-cli
    rustc
    rustup
    sublime4
    sourcegit

    pkg-config
    gobject-introspection
    glib

    sqlitebrowser
    devbox
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
    conda
    # nodejs_24
    gcc
    ccache
    gemini-cli
    claude-code
    github-copilot-cli
    httptoolkit
    redis
    # redisinsight
  ];
}
