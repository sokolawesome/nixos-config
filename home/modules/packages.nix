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
    xfce.thunar-archive-plugin
    pamixer
    playerctl
    grim
    tree
    slurp
    swappy
    qbittorrent
    networkmanagerapplet
    xarchiver
    jellyfin-ffmpeg
    mkvtoolnix-cli
    mpv

    catppuccin-gtk
    catppuccin-cursors
    papirus-icon-theme
    nerd-fonts.caskaydia-cove

    telegram-desktop
    zed-editor
  ];
}
