{pkgs, ...}: {
  home.packages = with pkgs; [pcmanfm];
  programs.atool.enable = true;
}
