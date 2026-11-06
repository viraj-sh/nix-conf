{pkgs, ...}: {
  imports = [];
  environment.systemPackages = with pkgs; [
    bluetuith
  ];

  hardware.bluetooth.enable = true;
}
