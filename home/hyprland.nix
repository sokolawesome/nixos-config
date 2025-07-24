{ config, ... }:

{
  xdg.configFile."hypr/hyprland.conf".text = ''
    # -----------------------------------------------------
    #--MONITORS & GENERAL--
    # -----------------------------------------------------
    monitor=HDMI-A-1,2560x1440@99.95,0x0,1
    monitor=,preferred,auto,1
    exec-once = waybar
    exec-once = dunst
    exec-once = hyprpaper
    exec-once = hypridle
    exec-once = nm-applet
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
        kb_options = grp:alt_shift_toggle,caps:escape
        follow_mouse = 1

        repeat_rate = 40
        repeat_delay = 210

        sensitivity = 0
    }
    general {
        gaps_in = 3
        gaps_out = 6
        border_size = 4

        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)

        layout = dwindle
        allow_tearing = true
    }

    decoration {
        rounding = 0

        active_opacity = 1.0
        inactive_opacity = 1.0
        fullscreen_opacity = 1.0

        blur {
            enabled = false
        }
    }
    animations {
        enabled = true
        bezier = easeInOutSine, 0.05, 0.6, 0.05, 1
        animation = windows, 1, 1, easeInOutSine, slide
        animation = fade, 1, 1, easeInOutSine
        animation = workspaces, 1, 3, easeInOutSine, slide
        animation = layers, 1, 1, easeInOutSine, slide
    }

    #################################
    #       GENERAL WINDOW RULES    #
    #################################

    # Prevent windows from being automatically maximized
    windowrule = suppressevent maximize, class:.*
    # Ignore focus for unnamed or background XWayland windows
    windowrule = nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0

    #################################
    #     WORKSPACE ASSIGNMENTS     #
    #################################

    # Browsers
    windowrulev2 = workspace 1 silent, class:^(zen|firefox|chromium)$

    # Messaging apps
    windowrulev2 = workspace 5 silent, class:^(org\.telegram\.desktop)$


    #################################
    #         FLOATING TOOLS        #
    #################################

    windowrulev2 = float, class:(thunar)
    windowrulev2 = float, class:(blueman-manager)
    windowrulev2 = float, class:^(nm-connection-editor)$
    windowrulev2 = float, class:^(org.kde.polkit-kde-authentication-agent-1)$
    windowrulev2 = center, class:^(org.kde.polkit-kde-authentication-agent-1)$
    windowrulev2 = float, class:^(org.pulseaudio.pavucontrol)$
    windowrulev2 = size 25% 75%, class:^(org.pulseaudio.pavucontrol)$
    windowrulev2 = move 74.9% 33, class:^(org.pulseaudio.pavucontrol)$

    #################################
    #     PICTURE-IN-PICTURE RULES  #
    #################################

    # PiP windows
    windowrulev2 = float, title:^(Picture-in-Picture)$
    windowrulev2 = pin, title:^(Picture-in-Picture)$
    windowrulev2 = size 25% 25%, title:^(Picture-in-Picture)$
    windowrulev2 = move 74% 74%, title:^(Picture-in-Picture)$

    #################################
    #     FILE CHOOSER DIALOGS      #
    #################################

    # Float and center GTK portal dialogs
    windowrulev2 = float, class:^(xdg-desktop-portal-gtk)$
    windowrulev2 = size 50% 50%, class:^(xdg-desktop-portal-gtk)$
    windowrulev2 = center, class:^(xdg-desktop-portal-gtk)$

    #################################
    #         OPTIONAL RULES        #
    #################################

    # Optional fallback for unnamed modal/dialog windows
    windowrulev2 = float, class:^$, title:^Dialog$
    windowrulev2 = center, class:^$, title:^Dialog$

    # -----------------------------------------------------
    #--KEYBINDS--
    # -----------------------------------------------------
    #--Applications--
    bind = $mainMod, Return, exec, $terminal
    bind = $mainMod, E, exec, $fileManager
    bind = $mainMod, D, exec, $menu
    bind = $mainMod ALT, V, exec, rofi -modi "clipboard:cliphist-rofi" -show clipboard -kb-cancel "Escape" -theme ${config.home.homeDirectory}/.config/rofi/config.rasi
    bind = $mainMod, H, exec, keyhint

    # Restart Waybar
    bind = $mainMod SHIFT, R, exec, pkill waybar; waybar

    #--Window Management--
    bind = $mainMod, Q, killactive,
    bind = $mainMod, F, togglefloating,
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle

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
    bind = $mainMod, TAB, workspace, m+1
    bind = $mainMod SHIFT, TAB, workspace, m-1
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
    bind = $mainMod, S, exec, bash -c 'region=$(slurp); sleep 0.25; [ -n "$region" ] && grim -g "$region" - | wl-copy'
    bind = $mainMod CTRL, S, exec, bash -c 'region=$(slurp); sleep 0.25; [ -n "$region" ] && grim -g "$region" - | swappy -f -'
  '';
}
