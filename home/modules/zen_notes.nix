{
  pkgs,
  unstable,
  ...
}: let
  unstablePkgs = unstable.legacyPackages.${pkgs.system};
in {
  home.packages = with pkgs; [unstablePkgs.zennotes-desktop];
}
