{
  config,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    compose2nix
    docker-buildx
    buildkit
    # docker-client
  ];

  programs.virt-manager.enable = true;
  services.spice-vdagentd.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    docker = {
      # enable = true;
      enableOnBoot = true;
      package = pkgs.docker;
      extraPackages = [ pkgs.docker-buildx ];
      autoPrune.enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    oci-containers = {
      backend = "docker";
    };
  };
}
