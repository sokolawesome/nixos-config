{ pkgs, ... }:

{
  home.packages = with pkgs; [
    telegram-desktop
    teams-for-linux
    vscode
    zed-editor
  ];
}
