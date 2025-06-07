{ pkgs, config, ... }:

{
  imports = [ ./hyprland.nix ./waybar.nix ];

  home.username = "sokolawesome";
  home.homeDirectory = "/home/sokolawesome";
  home.stateVersion = "25.05";

  # 1. PACKAGES
  # =================================================
  home.packages = with pkgs; [
    # Core Desktop
    kitty
    waybar
    rofi-wayland
    dunst
    wl-clipboard
    hyprpaper
    xfce.thunar
    pamixer
    playerctl
    grim
    slurp
    swappy
    swaylock-effects
    wlogout

    # Theme Packages
    catppuccin-gtk
    catppuccin-cursors
    papirus-icon-theme
    nerd-fonts.jetbrains-mono

    zed-editor
    vscode
    lazygit
  ];

  # 2. GTK, CURSORS, AND ICONS CONFIGURATION
  # =================================================
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

  # 3. APPLICATIONS CONFIGURATION
  # =================================================
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
        font = "JetBrainsMono Nerd Font 10";
        follow = "mouse";
      };
      urgency_low = {
        background = "#363a4f";
        foreground = "#cad3f5";
      };
      urgency_normal = {
        background = "#363a4f";
        foreground = "#cad3f5";
      };
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

  programs.git = {
    enable = true;
    userName = "sokolawesome";
    userEmail = "sokolawesome@gmail.com";
    extraConfig = { init.defaultBranch = "main"; };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "xiong-chiamiov-plus";
      plugins = [ "git" "archlinux" ];
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        nerdFonts = true;
        theme = {
          activeBorderColor = [ "#89b4fa" "bold" ];
          selectedLineBgColor = [ "#45475a" ];
          optionsTextColor = [ "#89b4fa" ];
        };
      };
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
      };
      os = { edit = "vscode"; };
    };
  };
}
