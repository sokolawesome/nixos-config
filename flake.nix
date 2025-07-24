{
  description = "NixOS Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      nixpkgsConfig = { allowUnfree = true; };

      mkSystem = name: hostConfig:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            { nixpkgs.config = nixpkgsConfig; }

            hostConfig
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.sokolawesome = {
                imports =
                  [ ./home/sokolawesome.nix ];
              };
            }
          ];
        };
    in {
      nixosConfigurations = {
        homelab = mkSystem "homelab" ./hosts/homelab/configuration.nix;
      };

      packages.x86_64-linux = {
        homelab = self.nixosConfigurations.homelab.config.system.build.toplevel;
      };
    };
}
