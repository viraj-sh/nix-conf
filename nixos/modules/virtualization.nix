{...}: {
  programs.virt-manager.enable = true;
  services.spice-vdagentd.enable = true;
  virtualisation = {
    libvirtd.enable = true;
    docker = {
      enableOnBoot = true;
      autoPrune.enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
      daemon.settings.live-restore = false;
    };
    oci-containers.backend = "docker";
  };
}
