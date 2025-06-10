{ ... }:

{
  imports = [
    ../../modules/core/core.nix
    ../../modules/hardware/hardware.nix
    ./hardware-configuration.nix
  ];
}
