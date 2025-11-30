{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];

  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font = {
      name = lib.mkForce "JetBrainsMono Nerd Font Mono";
      size = lib.mkForce 14;
    };
    themeFile = "everforest_dark_hard";
    settings = {
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;
      window_padding_width = 5;
    };
  };
}
