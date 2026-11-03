{ pkgs, unstable, ... }:
let
  unstablePkgs = unstable.legacyPackages.${pkgs.system};
in
{
  home.packages = with pkgs; [
    (pkgs.st.overrideAttrs (_: {
      src = ../../config/st;
      patches = [ ];
    }))
    (pkgs.dmenu.overrideAttrs (_: {
      src = ../../config/dmenu;
      patches = [ ];
    }))
    slock
    unstablePkgs.surf
  ];

  services.dwm-status = {
    enable = true;
    order = [ "battery" "cpu_load" "time" ];
    extraConfig = {
      time = {
        format = "%F %a %r";
        update_seconds = false;
      };
    };
  };
}
