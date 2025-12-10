{
  config,
  pkgs,
  lib,
  ...
}: let
in {
  imports = [];

  home.packages = with pkgs; [
    chromium
  ];
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
