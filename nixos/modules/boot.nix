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
    kernelParams = ["debug"];
    plymouth.enable = false;
    kernel.sysctl."vm.swappiness" = 60;
    loader.grub.timeoutStyle = "menu";
    loader.efi.efiSysMountPoint = "/boot";
  };
}
