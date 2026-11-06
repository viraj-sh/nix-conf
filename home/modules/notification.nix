{pkgs, ...}: {
  home.packages = with pkgs; [libnotify];
  serices.dunst = {
    enable = true;
    enableX11 = true;
    settings = {};
  };
}
