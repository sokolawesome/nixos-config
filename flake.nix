{
  description = "NixOS Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      mkSystem = name: hostConfig: nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          hostConfig
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.sokolawesome = {
              imports = [ ./home/sokolawesome.nix ];
            };
          }
        ];
      };
    in {
      nixosConfigurations = {
        homelab = mkSystem "homelab" ./hosts/homelab/configuration.nix;
        # devmachine = mkSystem "devmachine" ./hosts/devmachine/configuration.nix;
      };
    };
}
