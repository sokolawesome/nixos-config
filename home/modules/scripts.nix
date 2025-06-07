{ pkgs, config, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "keyhint" ''
      grep -oP 'bind = .*' ${config.home.homeDirectory}/.nixos-config/home/hyprland.nix | sed 's/bind = //g' | rofi -dmenu -i -p "󰌌 Keybinds"
    '')
  ];
}
