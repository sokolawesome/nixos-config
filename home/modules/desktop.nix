{ pkgs, ... }:

{
  imports = [
    ../hyprland.nix
    ../waybar.nix
  ];

  services.cliphist = {
    enable = true;
    maxEntries = 100;
  };
}
