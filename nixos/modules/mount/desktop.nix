{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  fileSystems."/mnt/shared" = {
    device = "/dev/disk/by-uuid/288CD38A8CD35034";
    fsType = "ntfs-3g";
    options = ["rw" "uid=1000" "gid=1000" "window_names" "nofail"];
  };
}
