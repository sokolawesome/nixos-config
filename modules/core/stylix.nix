{ pkgs, ... }:

{
  stylix = {
    autoEnable = true;
    targets.console.enable = true;
    image = ../../assets/wallpaper.png;
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu-fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu-fonts;
        name = "DejaVu Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji-blob-bin;
        name = "Noto Color Emoji";
      };
    };
  };

  environment.sessionVariables = { QT_QPA_PLATFORMTHEME = "qt5ct"; };
}
