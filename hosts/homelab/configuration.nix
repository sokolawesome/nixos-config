{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixos/common.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/dev.nix
    ../../modules/nixos/media-server.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/security.nix
    ../../modules/nixos/virtualization.nix
  ];

  networking.hostName = "homelab";
}
