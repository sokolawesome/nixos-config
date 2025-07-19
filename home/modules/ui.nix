{ pkgs, config, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Standard-Blue-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "macchiato";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.pointerCursor = {
    name = "Catppuccin-Macchiato-Blue";
    package = pkgs.catppuccin-cursors.macchiatoBlue;
    size = 24;
  };

  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Macchiato";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        format = "<b>%s</b>\\n%b";
        font = "JetBrainsMono Nerd Font 14";
        follow = "mouse";
      };
      urgency_low.background = "#363a4f";
      urgency_low.foreground = "#cad3f5";
      urgency_normal.background = "#363a4f";
      urgency_normal.foreground = "#cad3f5";
      urgency_critical = {
        background = "#ed8796";
        foreground = "#24273a";
        frame_color = "#ee99a0";
      };
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload =
        [ "${config.home.homeDirectory}/.nixos-config/assets/wallpaper.png" ];
      wallpaper =
        [ ",${config.home.homeDirectory}/.nixos-config/assets/wallpaper.png" ];
    };
  };
}
