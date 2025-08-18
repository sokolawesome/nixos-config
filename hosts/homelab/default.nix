{ ... }:

{
  imports = [
    ./hardware.nix

    ../../modules/nixos/core
    ../../modules/nixos/hardware/audio.nix
    ../../modules/nixos/hardware/graphics.nix
    ../../modules/nixos/hardware/storage.nix
    
    ../../modules/nixos/desktop/hyprland.nix
    ../../modules/nixos/desktop/display-manager.nix
    ../../modules/nixos/desktop/portals.nix
    
    ../../modules/nixos/services/media.nix
    ../../modules/nixos/services/monitoring.nix
    ../../modules/nixos/services/networking.nix
    ../../modules/nixos/services/qbittorrent.nix
    ../../modules/nixos/services/trilium.nix
    
    ../../modules/nixos/development/containers.nix
    ../../modules/nixos/development/languages.nix
    
    ../../modules/nixos/security/keyring.nix
  ];
}