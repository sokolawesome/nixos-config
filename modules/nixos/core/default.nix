{ ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./nix.nix
    ./packages.nix
    ./users.nix
  ];

  services.fstrim.enable = true;
}