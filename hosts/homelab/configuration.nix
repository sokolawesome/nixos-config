{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixos/common.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/security.nix
  ];

  networking.hostName = "homelab";
}
