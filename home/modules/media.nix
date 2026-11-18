{pkgs, ...}: {
  imports = [
  ];
  home.packages = with pkgs; [mpv];

  services.playerctld = {
    enable = true;
    package = pkgs.playerctl;
  };
}
