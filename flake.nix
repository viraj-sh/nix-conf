{
  description = "Multi-host Nix flake (Desktop + Server + MacOS + Laptop)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-26.05";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    unstable,
    nvf,
    stylix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.${system}.suckless = pkgs.mkShell {
      # toolchain + headers/libs
      packages = with pkgs; [
        pkg-config
        libx11
        libxft
        libxinerama
        fontconfig
        freetype
        harfbuzz
        gcc
        gnumake
      ];
    };

    # ===================
    # ==> Desktop Host<==
    # ===================
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
          home-manager.extraSpecialArgs = {inherit unstable;};
          home-manager.users.virajs-desktop = {...}: {
            imports = [
              ./home/desktop.nix
              nvf.homeManagerModules.default
            ];
          };
        }
      ];
    };
  };
}
