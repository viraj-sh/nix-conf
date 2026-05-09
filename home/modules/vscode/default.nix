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
    github-copilot-cli
  ];
<<<<<<< HEAD
=======
>>>>>>> b1b0300d8cb28cced5227915cf9ccbc4dec9d576
}
