{ pkgs, constants, ... }:

{
  home.packages = [ pkgs.hyprpaper ];

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${constants.paths.assets}/assets/${constants.theme.wallpaper}" ];
      wallpaper = [ ",${constants.paths.assets}/assets/${constants.theme.wallpaper}" ];
    };
  };
}
