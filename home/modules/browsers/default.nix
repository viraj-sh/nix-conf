{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [];

  home.packages = with pkgs; [
    brave
    google-chrome
    qutebrowser
    librewolf
  ];
  programs.brave.nativeMessagingHosts = [
    pkgs.kdePackages.plasma-browser-integration
  ];
  services.psd.browsers = ["qutebrowser"];
}
