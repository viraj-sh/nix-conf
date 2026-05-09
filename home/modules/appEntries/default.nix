{
  config,
  pkgs,
  lib,
  ...
}: let
  browser = pkgs.lib.getExe pkgs.brave;
  chromium = pkgs.lib.getExe pkgs.chromium;
in {
  imports = [
  ];
  home.packages = with pkgs; [
    appimage-run
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
      "inode/directory" = "pcmanfm.desktop";
    };
  };

  xdg.desktopEntries = {
    whatsapp-web = {
      name = "WhatsApp Web";
      genericName = "Web App";
      comment = "Use WhatsApp Web like an app";
      exec = "${browser} --app=https://web.whatsapp.com/";
      icon = "whatsapp";
      terminal = false;
    };
    telegram = {
      name = "Telegram";
      genericName = "Web App";
      comment = "Use Telegram like an app";
      exec = "${browser} --app=https://web.telegram.org/";
      icon = "telegram";
      terminal = false;
    };
    vsserver = {
      name = "VSServer";
      genericName = "Web App";
      comment = "Use VS Code like an app";
      exec = "${browser} --app=https://vscode.viraj.top";
      icon = "vscode";
      terminal = false;
    };
    jupyterhub = {
      name = "Jupyter Hub";
      genericName = "Web App";
      comment = "Use Jupyter Hub like an app";
      exec = "${browser} --app=https://server.jupyterhub/";
      icon = "jupyterhub";
      terminal = false;
    };
    sonyliv = {
      name = "Sony Liv";
      genericName = "Web App";
      comment = "Use Sony Liv like an app";
      exec = "${chromium} --app=https://www.sonyliv.com/";
      icon = "sonyliv";
      terminal = false;
    };
    helium = {
      name = "Helium";
      comment = "Helium AppImage";
      exec = "${pkgs.appimage-run}/bin/appimage-run /home/virajs-desktop/app-images/helium-0.11.7.1-x86_64.AppImage";
      icon = "helium";
      terminal = false;
      categories = ["Utility" "Application"];
    };
  };
}
