{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
  ];

  # Nix Settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };
}
