{config, ...}: {
  home.file."/mnt/data/docker".source = config.lib.file.mkOutOfStoreSymlink "/home/virajs-desktop/nix-conf/docker";
}
