{
  pkgs,
  unstable,
  ...
}: let
  unstablePkgs = unstable.legacyPackages.${pkgs.system};
in {
  home.packages = with pkgs; [
    (pkgs.st.overrideAttrs (_: {
      src = ../../config/st;
    }))
    (pkgs.dmenu.overrideAttrs (_: {
      src = ../../config/dmenu;
    }))
    (pkgs.slstatus.overrideAttrs (_: {
      src = ../../config/slstatus;
      postPatch = "";
    }))
    slock
    unstablePkgs.surf
  ];
}
