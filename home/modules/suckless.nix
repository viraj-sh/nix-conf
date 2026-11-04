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
    order = [ "time" "cpu_load" "backlight" "audio" "network" ];
    extraConfig = {
      time = {
        format = ":%I:%M %p - %a, %d %b %Y";
        update_seconds = false;
      };
    };
  };
}
