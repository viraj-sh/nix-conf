{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./modules/git.nix
    ./modules/browser.nix
    ./modules/alacritty.nix
    ./modules/nvim.nix
    ./modules/suckless.nix
    ./modules/zed.nix
    ./modules/shell.nix
    ./modules/cursor.nix
    ./modules/monitor.nix
    ./modules/media.nix
    ./modules/fastfetch.nix
    ./modules/app_entries.nix
    ./modules/nextcloud.nix
    ./modules/filemanager.nix
    ./modules/feh.nix
    ./modules/obs.nix
    ./modules/notification.nix
    ./modules/screenshot.nix
    ./modules/ocr.nix
    ./modules/onlyoffice.nix
    ./modules/discord.nix
    ./modules/claude.nix
    ./modules/yaak.nix
    ./modules/zen_notes.nix
    ./modules/zotero.nix
    ./modules/openshot.nix
    ./modules/gimp.nix
    ./modules/droidcam.nix
  ];
  home.packages = with pkgs; [ntfy-sh jq];
  home = {
    username = "virajs-desktop";
    homeDirectory = lib.mkForce "/home/virajs-desktop";
    stateVersion = "26.05";
  };
  programs.home-manager.enable = true;
  home.sessionPath = ["$HOME/.local/bin"];
}
