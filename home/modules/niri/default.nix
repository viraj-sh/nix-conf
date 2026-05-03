{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  # environment.systemPackages = with pkgs; [
  # ];
  # services = {
  #   pipewire = {
  #     enable = lib.mkForce true;
  #     alsa.enable = true;
  #     pulse.enable = true;
  #     jack.enable = true;
  #     package = pkgs.pipewire;
  #     wireplumber.enable = true;
  #   };
  # };

  # security = {
  #   polkit = {
  #     enable = true;
  #     package = pkgs.polkit;
  #     debug = true;
  #   };
  # };

  # hardware.alsa.enable = true;
  # hardware.bluetooth.enable = true;
  # xdg.portal.enable = true;

}
