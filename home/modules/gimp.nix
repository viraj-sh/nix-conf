{pkgs, ...}: {
  home.packages = with pkgs; [inkscape gimp-with-plugins];
}
