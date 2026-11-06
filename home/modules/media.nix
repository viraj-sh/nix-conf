{pkgs, ...}: {
  imports = [
  ];
  services.playerctld = {
    enable = true;
    package = pkgs.playerctl;
  };
}
