{
  pkgs,
  config,
  ...
}: let
  wallpaper = "/Users/virajs/Nextcloud/Pictures/Wallpapers/Desktop/nord_nixos.jpg";
  desktoppr = "/usr/local/bin/desktoppr";
in {
  imports = [
    ./stylix.nix
  ];
  launchd.user.agents.desktoppr-wallpaper = {
    serviceConfig = {
      ProgramArguments = [
        desktoppr
        wallpaper
      ];
      RunAtLoad = true;
    };
  };
  users.users = {
    virajs = {
      uid = 501; # macOS user ID
      shell = pkgs.zsh; # optional
      home = "/Users/virajs"; # optional, usually detected automatically
    };
  };
  environment.systemPackages = [
    pkgs.tree
    pkgs.mkalias
    pkgs.javaPackages.compiler.openjdk21
    pkgs.btop
    pkgs.python312
    pkgs.parallel
    pkgs.tesseract
    pkgs.ocrmypdf 
    pkgs.poppler-utils
    pkgs.poppler
    pkgs.pdfgrep

  ];

  nix.settings.experimental-features = "nix-command flakes";

  system.configurationRevision = null;
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  system.primaryUser = "virajs";

  system.defaults = {
    # finder.FXPreferredViewStyle = {"clmv"};
    WindowManager = {
      StageManagerHideWidgets = true;	
      StandardHideWidgets = true;
      EnableStandardClickToShowDesktop = false;
    };
    dock = {
      autohide = false;
      show-recents = false;
      tilesize = 38;
      mineffect = "genie";
      orientation = "left";
      minimize-to-application = true;
      mru-spaces = false;
      persistent-apps = [
        "/System/Applications/Apps.app"
        "${pkgs.kitty}/Applications/kitty.app"
        "${pkgs.brave}/Applications/Brave Browser.app"
        "/Applications/Obsidian.app"
        "/Applications/Comet.app"
        "${pkgs.discord}/Applications/Discord.app"
        "${pkgs.bruno}/Applications/Bruno.app"
        "${pkgs.vscode}/Applications/Visual Studio Code.app"
      ];
    };
  };

  homebrew = {
    enable = true;
    user = "virajs";
    casks = [
      "pearcleaner"
      "nextcloud"
      "desktoppr"
      "obsidian"
      "whatsapp"
      "neohtop"
      "intellij-idea"
      "comet"
      "docker-desktop"
      "visual-studio-code"
      "mysql-shell"
    ];
    onActivation = {
      cleanup = "zap";
      upgrade = true;
      autoUpdate = true;
    };
    global = {
      autoUpdate = true;
      brewfile = false;
    };
  };
}
