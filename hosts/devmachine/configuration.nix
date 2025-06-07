{ ... }:

{
  imports = [
    # ./hardware-configuration.nix

    ../../modules/nixos/common.nix
    ../../modules/nixos/desktop.nix
  ];

  networking.hostName = "devmachine";
}
