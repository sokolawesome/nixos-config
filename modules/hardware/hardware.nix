{ pkgs, host, ... }:

{
  imports = [ ./graphics.nix ]
    ++ (pkgs.lib.optional (host == "devmachine") ./nvidia.nix);

  hardware.enableRedistributableFirmware = true;
}
