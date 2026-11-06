{pkgs, ...}: {
  imports = [];
  environment.systemPackages = with pkgs; [
    intel-media-driver
  ];

  hardware = {
    graphics.enable = true;
    graphics.extraPackages = [pkgs.intel-media-driver];
    alsa.enable = true;
  };
}
