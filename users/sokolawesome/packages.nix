{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    networkmanagerapplet
    xarchiver
    jellyfin-ffmpeg
    mkvtoolnix-cli
    mpv
    telegram-desktop
    zed-editor
  ];
}