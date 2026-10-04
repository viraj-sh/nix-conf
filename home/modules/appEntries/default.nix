{
  config,
  pkgs,
  lib,
  ...
}:
let
  browser = pkgs.lib.getExe pkgs.brave;
  chromium = pkgs.lib.getExe pkgs.chromium;
in
{
  imports = [
  ];
  home.packages = with pkgs; [
    appimage-run
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "com.brave.Browser.desktop";
      "x-scheme-handler/http" = "com.brave.Browser.desktop";
      "x-scheme-handler/https" = "com.brave.Browser.desktop";
      "x-scheme-handler/about" = "com.brave.Browser.desktop";
      "x-scheme-handler/unknown" = "com.brave.Browser.desktop";
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
      exec = "${browser} --app=http://192.168.1.104:3155";
      icon = "vscode";
      terminal = false;
    };
    jupyterhub = {
      name = "Jupyter Hub";
      genericName = "Web App";
      comment = "Use Jupyter Hub like an app";
      exec = "${browser} --app=https://jupyterhub.viraj.top/";
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
    tlauncher = {
      name = "TLauncher";
      genericName = "Game";
      comment = "Use Tlauncher like an app";
      exec = "steam-run java -jar /home/virajs-desktop/Downloads/TLauncher.v18/TLauncher.jar";
      icon = "minecraft";
      terminal = false;
    };

    test = {
      name = "test";
      genericName = "Python App";
      comment = "Use python projects like an app";
      exec = "/home/virajs-desktop/git-repo/test/pyinstaller_learn/01_simple/dist/main";
      icon = "sonyliv";
      terminal = false;
    };

    helium = {
      name = "Helium";
      comment = "Helium AppImage";
      exec = "${pkgs.appimage-run}/bin/appimage-run /home/virajs-desktop/app-images/helium-0.11.7.1-x86_64.AppImage";
      icon = "helium";
      terminal = false;
      categories = [
        "Utility"
        "Application"
      ];
    };
    chess = {
      name = "Chess";
      comment = "Chess AppImage";
      exec = "${pkgs.appimage-run}/bin/appimage-run /home/virajs-desktop/app-images/en-croissant_0.15.0_amd64.AppImage";
      icon = "Chess";
      terminal = false;
      categories = [
        "Utility"
        "Application"
      ];
    };

  };
}
