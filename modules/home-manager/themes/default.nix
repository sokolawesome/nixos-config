{ pkgs, constants, ... }:

{
  home.packages = with pkgs; [
    catppuccin-gtk
    catppuccin-cursors
    papirus-icon-theme
    nerd-fonts.caskaydia-cove
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = constants.theme.iconTheme;
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
    gtk3.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
    gtk4.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
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
}