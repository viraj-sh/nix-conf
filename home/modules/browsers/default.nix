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
    chromium
    qutebrowser
    librewolf
  ];
  programs.brave.nativeMessagingHosts = [
    pkgs.kdePackages.plasma-browser-integration
  ];
  services.psd.browsers = ["qutebrowser"];
  programs.chromium = {
    enable = true;
    extensions = [
      {id = "nngceckbapebfimnlniiiahkandclblb";}
      {id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";}
      {id = "hkgfoiooedgoejojocmhlaklaeopbecg";}
      {id = "bkhaagjahfmjljalopjnoealnfndnagc";}
      {id = "geaffgbbnknlakljecclnkofiffmbdbk";}
      {id = "ojplmecpdpgccookcobabopnaifgidhf";}
    ];
  };
}
