{
  description = "Multi-host Nix flake (macOS + future hosts)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-25.11";
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    stylix,
    unstable,
    ...
  }: {
    # === macOS Host ===
    darwinConfigurations."virajs" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/macos/default.nix
        stylix.darwinModules.stylix
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            users.virajs = import ./home/macos.nix;
          };
        }
      ];
    };

    # === NixOS hosts will come here later ===
    # nixosConfigurations.<hostname> = nixpkgs.lib.nixosSystem { modules = [ ./hosts/nixos/<file>.nix ]; };

    # === Linux (Nix-on-Linux) hosts later ===
  };
}
