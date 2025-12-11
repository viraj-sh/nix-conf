{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    docker
    docker-compose
    lazydocker
  ];
}
