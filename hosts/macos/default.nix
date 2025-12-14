{
  pkgs,
  config,
  ...
}: let
  wallpaper = "/Users/virajs/Nextcloud/Pictures/Wallpapers/Desktop/everforest_wp.jpg";
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
        "${pkgs.kitty}/Applications/kitty.app"
        "${pkgs.brave}/Applications/Brave Browser.app"
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
      "obs"
      "github"
      "logseq"
      "desktoppr"
      "obsidian"
      "whatsapp"
      "intellij-idea"
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
