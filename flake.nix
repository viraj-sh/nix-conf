{
  description = "Multi-host Nix flake (Desktop + Server + MacOS + Laptop)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    unstable,
    ...
  }: {

    # ===================
    # ==> Desktop Host<==
    # ===================
    nixosConfigurations."virajs-desktop" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit self nixpkgs home-manager unstable;};
      modules = [
        ./hosts/desktop
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = { inherit unstable; };
          home-manager.users.virajs-desktop = {pkgs, ...}: {
            imports = [
              ./home/desktop.nix
            ];
          };
        }
      ];
    };


  };
}
