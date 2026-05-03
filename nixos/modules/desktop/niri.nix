{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
  xwayland
];

  # Enable experimental features if needed
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable Wayland + Niri
  programs.niri = {
    enable = true;
    };
  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "niri";

  # Input + graphics
  services.libinput.enable = true;
  hardware.graphics.enable = true;

}