{ nixpkgs, home-manager, ... }:

let
  constants = import ./constants.nix;
in

{
  inherit constants;

  mkSystem = hostConfig: nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit constants; };
    modules = [
      { nixpkgs.config.allowUnfree = true; }
      hostConfig
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit constants; };
          users.${constants.user.name} = import ../users/${constants.user.name};
        };
      }
    ];
  };
}