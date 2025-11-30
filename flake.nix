{
  description = "Multi-host Nix flake (macOS + future hosts)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nix-darwin, ... }:
  {
    # === macOS Host ===
    darwinConfigurations."virajs" = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/macos/default.nix
      ];
    };

    # === NixOS hosts will come here later ===
    # nixosConfigurations.<hostname> = nixpkgs.lib.nixosSystem { modules = [ ./hosts/nixos/<file>.nix ]; };

    # === Linux (Nix-on-Linux) hosts later ===
  };
}

