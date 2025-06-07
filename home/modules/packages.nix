{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    htop
    rofi-wayland
    dunst
    wl-clipboard
    cliphist
    hyprpaper
    xfce.thunar
    pamixer
    playerctl
    grim
    slurp
    swappy
    swaylock-effects
    wlogout

    catppuccin-gtk
    catppuccin-cursors
    papirus-icon-theme
    nerd-fonts.jetbrains-mono

    telegram-desktop
    teams-for-linux
    vscode
    zed-editor
  ];
}
