{ pkgs, ... }:

{
  imports = [
    ../hyprland.nix
    ../waybar.nix
    ../rofi.nix
  ];

  services.cliphist = {
    enable = true;
    allowImages = true;
    extraOptions = [ "-max-items" "100" ];
    systemdTargets = [ "graphical-session.target" ];
  };
}
