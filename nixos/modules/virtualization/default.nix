{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
  ];

  virtualisation = {
    libvirtd.enable = true;
    docker = {
      enable = true;
      enableOnBoot = true;
      package = pkgs.docker;
      autoPrune.enable = true;
    };
    oci-containers = {
      backend = "docker";
    };
  };
}
