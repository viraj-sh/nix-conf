{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [
    ./chromium.nix
  ];

  home.packages = with pkgs; [
    brave
    # google-chrome
    qutebrowser
    bitwarden-cli
    keyutils
    python312Packages.tldextract
    python312Packages.pyperclip
    # librewolf
  ];
  # programs.brave.nativeMessagingHosts = [
  #   pkgs.kdePackages.plasma-browser-integration
  # ];
  services.psd.browsers = ["qutebrowser"];
}
