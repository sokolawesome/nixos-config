{
  description = "sokolawesome`s NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:aylur/ags";
  };

  outputs =
    { nixpkgs, self, ... }@inputs:
    let
      username = "sokolawesome";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        devmachine = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/devmachine ];
          specialArgs = {
            host = "devmachine";
            inherit self inputs username;
          };
        };
        homelab = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/homelab ];
          specialArgs = {
            host = "homelab";
            inherit self inputs username;
          };
        };
    };
}
