{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
  ];
  home.packages = with pkgs; [

    vlc
    yt-dlp
    ffmpeg
    showmethekey
  ];
  programs.obs-studio = {
    package = pkgs.obs-studio;
    enable = true;
    plugins = [
      pkgs.obs-studio-plugins.waveform
      pkgs.obs-studio-plugins.obs-pipewire-audio-capture

    ];
  };
}
