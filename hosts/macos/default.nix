{pkgs, ...}: {
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
  ];

  nix.settings.experimental-features = "nix-command flakes";

  system.configurationRevision = null;
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
}
