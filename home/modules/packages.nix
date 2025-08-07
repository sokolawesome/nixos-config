{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    btop
    rofi-wayland
    dunst
    wl-clipboard
    cliphist
    hyprpaper
    hypridle
    xfce.thunar
    pamixer
    playerctl
    grim
    tree
    slurp
    swappy
    qbittorrent
    mkvtoolnix

    catppuccin-gtk
    catppuccin-cursors
    papirus-icon-theme
    nerd-fonts.caskaydia-cove

    telegram-desktop
    zed-editor
  ];
}
