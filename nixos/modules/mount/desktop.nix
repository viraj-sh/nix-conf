{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  fileSystems."/mnt/shared" = {
    device = "/dev/disk/by-uuid/288CD38A8CD350C4";
    fsType = "ntfs-3g";
    options = ["rw" "uid=1000" "gid=1000" "window_names" "nofail"];
  };
  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/b72f2511-4cdb-4f0d-89b4-7dd264b802fd";
    fsType = "ext4";
  };
}
