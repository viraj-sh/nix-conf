{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  environment.systemPackages = with pkgs; [
    alsa-utils
  ];
  services = {
    pipewire = {
      enable = lib.mkForce true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
      package = pkgs.pipewire;
      wireplumber.enable = true;
    };
  };
  hardware.alsa.enablePersistence = true;
}
