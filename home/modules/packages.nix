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
    xfce.thunar
    pamixer
    playerctl
    grim
    slurp
    swappy
    transmission_4-gtk

    catppuccin-gtk
    catppuccin-cursors
    papirus-icon-theme
    nerd-fonts.jetbrains-mono

    telegram-desktop
    zed-editor
    amnezia-vpn
  ];
}
