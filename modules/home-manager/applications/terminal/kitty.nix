{ pkgs, constants, ... }:

{
  home.packages = [ pkgs.kitty ];

  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_storm";
    font = {
      name = constants.theme.font;
      size = 12;
    };
    extraConfig = ''
      map ctrl+shift+c copy_to_clipboard
      map ctrl+shift+v paste_from_clipboard
    '';
  };
}