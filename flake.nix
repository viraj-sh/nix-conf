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
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
  };

  outputs = {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    stylix,
    nixvim,
    nvf,
    unstable,
    agenix,
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
        nvf.nixosModules.default
        agenix.nixosModules.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.virajs-server = {pkgs, ...}: {
            imports = [
              ./home/server.nix
            ];
          };
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
          home-manager.users.virajs-desktop = {pkgs, ...}: {
            imports = [
              ./home/desktop.nix
            ];
          };
        }
      ];
    };

    # === NixOS hosts will come here later ===
    # nixosConfigurations.<hostname> = nixpkgs.lib.nixosSystem { modules = [ ./hosts/nixos/<file>.nix ]; };

    # === Linux (Nix-on-Linux) hosts later ===
  };
}
