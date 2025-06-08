{ config, ... }:

{
  xdg.configFile."hypr/hyprland.conf".text = ''
    # -----------------------------------------------------
    #--MONITORS & GENERAL--
    # -----------------------------------------------------
    monitor=,preferred,auto,1
    exec-once = waybar
    exec-once = dunst
    exec-once = hyprpaper
    exec-once = wl-paste --type text --watch cliphist store -max-items 100
    exec-once = wl-paste --type image --watch cliphist store -max-items 100
    exec-once = wl-clip-persist --clipboard regular

    # -----------------------------------------------------
    #--VARIABLES--
    # -----------------------------------------------------
    $mainMod = SUPER
    $terminal = kitty
    $fileManager = thunar
    $menu = rofi -show drun -theme ${config.home.homeDirectory}/.config/rofi/config.rasi

    # -----------------------------------------------------
    #--CORE--
    # -----------------------------------------------------
    input {
        kb_layout = us,ru
        kb_options = grp:alt_shift_toggle
        follow_mouse = 1
    }
    general {
        gaps_in = 5
        gaps_out = 10
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
        layout = dwindle
    }
    decoration {
        rounding = 5
        blur {
            enabled = true
            size = 3
            passes = 1
        }
    }
    animations {
        enabled = yes
    }
    dwindle {
        pseudotile = yes
        preserve_split = yes
    }

    # -----------------------------------------------------
    #--KEYBINDS--
    # -----------------------------------------------------
    #--Applications--
    bind = $mainMod, Return, exec, $terminal
    bind = $mainMod, E, exec, $fileManager
    bind = $mainMod, D, exec, $menu
    bind = $mainMod ALT, V, exec, rofi -modi "clipboard:cliphist-rofi" -show clipboard -kb-cancel "Escape" -theme ${config.home.homeDirectory}/.config/rofi/config.rasi
    bind = $mainMod, H, exec, keyhint

    #--Window Management--
    bind = $mainMod, Q, killactive,
    bind = $mainMod, F, togglefloating,
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle
    bind = $mainMod SHIFT, G, exec, hyprctl --batch "keyword animations:enabled 0; keyword decoration:blur:enabled 0; keyword decoration:drop_shadow 0; keyword decoration:rounding 0"
    bind = $mainMod ALT, G, exec, hyprctl --batch "keyword animations:enabled 1; keyword decoration:blur:enabled 1; keyword decoration:drop_shadow 1; keyword decoration:rounding 10"

    #--Move focus--
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    #--Move windows--
    bind = $mainMod ALT, left, movewindow, l
    bind = $mainMod ALT, right, movewindow, r
    bind = $mainMod ALT, up, movewindow, u
    bind = $mainMod ALT, down, movewindow, d

    #--Resize windows--
    binde = $mainMod SHIFT, right, resizeactive, 10 0
    binde = $mainMod SHIFT, left, resizeactive, -10 0
    binde = $mainMod SHIFT, up, resizeactive, 0 -10
    binde = $mainMod SHIFT, down, resizeactive, 0 10

    #--Workspaces--
    # Using number keys
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    #--Move window to workspace--
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    #--Scroll through workspaces--
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    #--Mouse bindings--
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    # -----------------------------------------------------
    #--SYSTEM & HARDWARE BINDS
    # -----------------------------------------------------
    #--Session Control--
    bind = $mainMod, M, exit, # Exit Hyprland
    bind = CTRL ALT, L, exec, swaylock # Lock screen
    bind = CTRL ALT, P, exec, wlogout -p # Power menu (wlogout)
    bindl= , xf86Sleep, exec, systemctl suspend

    #--Volume and Media Control--
    bindel= , XF86AudioRaiseVolume, exec, pamixer -i 5 # Increase volume
    bindel= , XF86AudioLowerVolume, exec, pamixer -d 5 # Decrease volume
    bindl= , XF86AudioMute, exec, pamixer -t # Mute volume
    bindl= , XF86AudioMicMute, exec, pamixer --default-source -t # Mute microphone
    bindl= , XF86AudioPlay, exec, playerctl play-pause # Play/Pause media
    bindl= , XF86AudioNext, exec, playerctl next # Next track
    bindl= , XF86AudioPrev, exec, playerctl previous # Previous track

    #--Screenshots--
    # Screenshot a selected area and copy to clipboard
    bind = $mainMod, S, exec, grim -g "$(slurp)" - | wl-copy
    # Screenshot the entire screen and copy to clipboard
    bind = $mainMod SHIFT, S, exec, grim - | wl-copy
    # Screenshot a selected area and open in Swappy to edit/save
    bind = $mainMod CTRL, S, exec, grim -g "$(slurp)" - | swappy -f -
  '';
}
