{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [ ];
  environment.systemPackages = with pkgs; [
  ];

  services.postgresql.enable = true;
  services.postgresql.settings = {
    listen_addresses = "localhost";
  };
  services.mongodb.enable = true;

  services.mongodb.package = pkgs.mongodb-ce;

}
