{
  pkgs,
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
    zen_notes = {
      name = "Zen Notes";
      comment = "Zen Notes AppImage";
      exec = "${pkgs.appimage-run}/bin/appimage-run /home/virajs-desktop/nix-conf/app-images/ZenNotes-2.83.0-linux-x86_64.AppImage";
      icon = "zen_notes";
      terminal = false;
      categories = ["Utility" "Application"];
    };
    helium = {
      name = "Helium";
      comment = "Helium AppImage";
      exec = "${pkgs.appimage-run}/bin/appimage-run /home/virajs-desktop/nix-conf/app-images/helium-0.21.1.1-x86_64.AppImage";
      icon = "helium";
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
