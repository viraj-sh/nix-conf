{
  pkgs,
  config,
  ...
}: let
  env = pkgs.buildEnv {
    name = "system-applications";
    paths = config.environment.systemPackages;
    pathsToLink = "/Applications";
  };
in {
  imports = [
    ./stylix.nix
  ];
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
  ];

  nix.settings.experimental-features = "nix-command flakes";

  system.configurationRevision = null;
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  system.primaryUser = "virajs";

  system.defaults.dock = {
    autohide = false;
    show-recents = false;
    tilesize = 38;
    mineffect = "genie";
    orientation = "left";
    minimize-to-application = true;
    mru-spaces = false;
    persistent-apps = [
      "/nix/store/aj1cv2ic5ziqsm72m95drzi9qq892q8z-kitty-0.42.1/Applications/kitty.app"
      "/nix/store/l6s54iapqgq0k3n3nw2wdxlzxbmqd4az-brave-1.85.111/Applications/Brave Browser.app"
      "/nix/store/cdp38sra1gml4dpy0nihc01jhf69vm8j-vscode-1.106.2/Applications/Visual Studio Code.app"
    ];
  };
  system.activationScripts.applications.text = pkgs.lib.mkForce ''
    echo "setting up /Applications..." >&2
    rm -rf /Applications/Nix\ Apps
    mkdir -p /Applications/Nix\ Apps
    find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
    while read -r src; do
      app_name=$(basename "$src")
      echo "copying $src" >&2
      ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
    done
  '';
  homebrew = {
    enable = true;
    user = "virajs";
    casks = [
      "pearcleaner"
      "nextcloud"
      "obs"
      "github"
      "logseq"
    ];
    onActivation = {
      cleanup = "uninstall";
      upgrade = false;
      autoUpdate = false;
    };
    global = {
      autoUpdate = false;
      brewfile = false;
    };
  };
}
