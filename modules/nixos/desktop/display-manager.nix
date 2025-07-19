{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-macchiato";
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
    enableHidpi = true;
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "sokolawesome";
  };

  services.displayManager.defaultSession = "hyprland";

  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "macchiato";
      font = "JetBrainsMono Nerd Font";
      fontSize = "12";
    })
  ];
}
