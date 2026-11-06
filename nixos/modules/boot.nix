{...}: {
  imports = [];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
      timeoutStyle = "menu";
    };
  };
  boot = {
    supportedFilesystems = ["ntfs"];
    kernelParams = ["debug" "i915.enable_psr=0"];
    kernelModules = ["snd-mixer-oss"];
    plymouth.enable = false;
    kernel.sysctl."vm.swappiness" = 60;
  };
}
