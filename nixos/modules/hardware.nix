{pkgs, ...}: {
  imports = [];
  environment.systemPackages = with pkgs; [
    intel-media-driver
    vpl-gpu-rt
  ];

  hardware = {
    graphics.enable = true;
    graphics.extraPackages = [pkgs.intel-media-driver pkgs.vpl-gpu-rt];
    alsa.enable = true;
  };
}
