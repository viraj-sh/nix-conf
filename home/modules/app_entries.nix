{
  config,
  pkgs,
  lib,
  unstable,
  ...
}: let
  unstablePkgs = unstable.legacyPackages.${pkgs.system};
  brave = pkgs.lib.getExe unstablePkgs.brave-origin;
in {
  home.packages = with pkgs; [appimage-run];
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "pcmanfm.desktop";
    };
  };
  xdg.desktopEntries = {
    hibi = {
      name = "Hibi";
      comment = "Hibi AppImage";
      exec = "${pkgs.appimage-run}/bin/appimage-run /home/virajs-desktop/nix-conf/app-images/hibi-0.2.7-linux-x64.AppImage";
      icon = "hibi";
      terminal = false;
      categories = ["Utility" "Application"];
    };
    sonyliv = {
      name = "Sony Liv";
      genericName = "Web App";
      comment = "Use Sony Liv like an app";
      exec = "${brave} --app=https://www.sonyliv.com/";
      icon = "sonyliv";
      terminal = false;
    };
  };
}
