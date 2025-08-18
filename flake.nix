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
      lib = import ./lib { inherit nixpkgs home-manager; };
    in {
      nixosConfigurations = {
        homelab = lib.mkSystem ./hosts/homelab;
      };

      packages.x86_64-linux = {
        homelab = self.nixosConfigurations.homelab.config.system.build.toplevel;
      };
    };
}