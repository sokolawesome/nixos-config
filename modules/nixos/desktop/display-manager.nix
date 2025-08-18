{ pkgs, constants, ... }:

{
  services.displayManager = {
    sddm = {
      enable = true;
      theme = "catppuccin-macchiato";
      package = pkgs.kdePackages.sddm;
      wayland.enable = true;
      enableHidpi = true;
    };
    autoLogin = {
      enable = true;
      user = constants.user.name;
    };
    defaultSession = "hyprland";
  };

  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "macchiato";
      font = constants.theme.font;
      fontSize = "12";
    })
  ];
}