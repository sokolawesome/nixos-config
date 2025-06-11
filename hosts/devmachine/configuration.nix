{ ... }:

{
  imports = [
    ../../modules/core/core.nix
    ../../modules/hardware/nvidia.nix
    ./hardware-configuration.nix
  ];
}
