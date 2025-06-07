{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.homelab = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
        inherit inputs;
        };
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
          home-manager.users.sokolawesome = import ./home.nix;
          }
        ];
      };
    };
}
