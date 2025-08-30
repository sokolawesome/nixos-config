{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    networkmanagerapplet
    xarchiver
    rar
    jellyfin-ffmpeg
    mkvtoolnix-cli
    mpv
    qbittorrent
    telegram-desktop
    zed-editor
  ];
}
