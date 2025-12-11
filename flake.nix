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
    nixvim.url = "github:nix-community/nixvim/nixos-25.11";
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    stylix,
    nixvim,
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
            users.virajs = {pkgs, ...}: {
              imports = [
                nixvim.homeModules.nixvim
                ./home/macos.nix
              ];
            };
          };
        }
      ];
    };
    # ===================
    # ==> NixOS hosts <==
    # ===================

    # === Server ===
    nixosConfigurations."virajs-server" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit self nixpkgs home-manager unstable;};
      modules = [
        ./hosts/server
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.virajs = import ./home/server.nix;
        }
      ];
    };

    # === Desktop ===
    nixosConfigurations."virajs-desktop" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit self nixpkgs home-manager unstable;};
      modules = [
        ./hosts/desktop
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.virajs = import [
            nixvim.homeModules.nixvim
            ./home/desktop.nix
          ];
        }
      ];
    };

    # === NixOS hosts will come here later ===
    # nixosConfigurations.<hostname> = nixpkgs.lib.nixosSystem { modules = [ ./hosts/nixos/<file>.nix ]; };

    # === Linux (Nix-on-Linux) hosts later ===
  };
}
