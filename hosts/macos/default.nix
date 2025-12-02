{pkgs, ...}: {
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
    pkgs.neovim
    pkgs.brave
    pkgs.tree
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
      "/nix/store/5l4gg55zzz7nldp9cd2jp2jzvdpdpdwq-brave-1.84.141/Applications/Brave Browser.app"
      "/nix/store/fkxwb5s1p1c0vrxam3q10l2pm0ln2dvy-vscode-1.105.0/Applications/Visual Studio Code.app"
    ];
};

}
