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
  boot.kernelParams = ["debug"];
  boot.plymouth.enable = false;
  boot.kernel.sysctl."vm.swappiness" = 60;
  boot.loader.grub.timeoutStyle = "hidden";
}
