{ pkgs, config, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "keyhint" ''
      grep -oP 'bind = .*' ${config.home.homeDirectory}/.nixos-config/home/hyprland.nix | sed 's/bind = //g' | rofi -dmenu -i -p "󰌌 Keybinds" -theme ${config.home.homeDirectory}/.config/rofi/config.rasi
    '')
  ];
}
