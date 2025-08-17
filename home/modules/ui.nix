{ pkgs, config, ... }:

{
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  home.pointerCursor = {
    name = "Numix-Cursor";
    package = pkgs.numix-cursor-theme;
    size = 24;
  };

  home.sessionVariables.GTK_THEME = "palenight";

  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_storm";
    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 12;
    };
    extraConfig = "map ctrl+shift+c copy_to_clipboard\n map = ctrl+shift+v paste_from_clipboard";
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        format = "<b>%s</b>\\n%b";
        font = "CaskaydiaCove Nerd Font 16";
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

  services.hypridle = {
    enable = true;
    settings = {
      general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
        };

        listener = [
          {
            timeout = 360;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
    };
  };
}
