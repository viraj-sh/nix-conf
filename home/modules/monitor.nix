{pkgs, ...}: {
  imports = [
  ];
  home.packages = with pkgs; [
    brightnessctl
  ];
}
