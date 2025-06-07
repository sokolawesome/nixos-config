{ pkgs, ... }:

{
  imports = [
    ../hyprland.nix
    ../waybar.nix
  ];

  services.cliphist = {
    enable = true;
    allowImages = true;
    extraOptions = [ "-max-items" "100" ];
  };
}
