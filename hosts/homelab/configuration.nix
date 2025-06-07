{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixos/common.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/development.nix
  ];

  networking.hostName = "homelab";
}
