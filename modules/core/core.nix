{ ... }:

{
  imports = [
    ./bootloader.nix
    ./kernel.nix
    ./network.nix
    ./nh.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
    ./xserver.nix
  ];
}
