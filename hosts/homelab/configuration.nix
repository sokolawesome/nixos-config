{ ... }:

{
  imports = [
    ../../modules/core/core.nix
    ../../modules/hardware/amd.nix
    ./hardware-configuration.nix
  ];
}
