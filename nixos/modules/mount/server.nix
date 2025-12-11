{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  fileSystems."/mnt/1TB_HDD" = {
    device = "/dev/disk/by-uuid/98dea232-fa5b-4957-8c53-934ae1ae850e";
    fsType = "ext4";
    options = ["defaults"];
  };
}
