{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
    };
  };
  boot = {
    supportedFilesystems = ["ntfs"];
    kernelParams = ["debug" "i915.enable_psr=0" ];
    kernelModules = [ "snd-mixer-oss" ];
    plymouth.enable = false;
    kernel.sysctl."vm.swappiness" = 60;
    loader.grub.timeoutStyle = "menu";
    loader.efi.efiSysMountPoint = "/boot";
  };
}
