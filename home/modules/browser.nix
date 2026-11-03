{
  config,
  pkgs,
  lib,
  unstable,
  ...
}:
let
  unstablePkgs = unstable.legacyPackages.${pkgs.system};
in
{
  imports = [];

  home.packages = with pkgs; [
    unstablePkgs.brave-origin
    ungoogled-chromium
    keyutils
    librewolf
  ];

}
