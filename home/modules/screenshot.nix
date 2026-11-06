{pkgs, ...}: {
  home.packages = with pkgs; [maim slop];
}
