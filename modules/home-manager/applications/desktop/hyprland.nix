{
  pkgs,
  constants,
  ...
}:

{
  home.packages = with pkgs; [
    rofi-wayland
    wl-clipboard
    cliphist
    xfce.thunar
    xfce.thunar-archive-plugin
    pamixer
    playerctl
    grim
    slurp
    swappy
  ];

  xdg.configFile."hypr/hyprland.conf".text = ''
    monitor=${constants.monitor.primary}
    monitor=${constants.monitor.fallback}

    exec-once = waybar
    exec-once = dunst
    exec-once = hyprpaper
    exec-once = hypridle
    exec-once = nm-applet
    exec-once = wl-paste --type text --watch cliphist store -max-items 100
    exec-once = wl-paste --type image --watch cliphist store -max-items 100
    exec-once = wl-clip-persist --clipboard regular

    $mainMod = SUPER
    $terminal = kitty
    $fileManager = thunar
    $menu = rofi -show drun -theme ${constants.paths.config}/rofi/config.rasi

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
    }

    animations {
        enabled = true
        bezier = easeInOutSine, 0.05, 0.6, 0.05, 1
        animation = windows, 1, 1, easeInOutSine, slide
        animation = fade, 1, 1, easeInOutSine
        animation = workspaces, 1, 3, easeInOutSine, slide
        animation = layers, 1, 1, easeInOutSine, slide
    }

    windowrule = suppressevent maximize, class:.*
    windowrule = nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0

    windowrulev2 = workspace 1 silent, class:^(zen|firefox|chromium)$
    windowrulev2 = workspace 5 silent, class:^(org\.telegram\.desktop)$

    windowrulev2 = float, class:(thunar)
    windowrulev2 = float, class:(blueman-manager)
    windowrulev2 = float, class:^(nm-connection-editor)$
    windowrulev2 = float, class:^(org.kde.polkit-kde-authentication-agent-1)$
    windowrulev2 = center, class:^(org.kde.polkit-kde-authentication-agent-1)$
    windowrulev2 = float, class:^(org.pulseaudio.pavucontrol)$
    windowrulev2 = size 25% 75%, class:^(org.pulseaudio.pavucontrol)$
    windowrulev2 = move 74.9% 33, class:^(org.pulseaudio.pavucontrol)$

    windowrulev2 = float, title:^(Picture-in-Picture)$
    windowrulev2 = pin, title:^(Picture-in-Picture)$
    windowrulev2 = size 25% 25%, title:^(Picture-in-Picture)$
    windowrulev2 = move 74% 74%, title:^(Picture-in-Picture)$

    windowrulev2 = float, class:^(xdg-desktop-portal-gtk)$
    windowrulev2 = size 50% 50%, class:^(xdg-desktop-portal-gtk)$
    windowrulev2 = center, class:^(xdg-desktop-portal-gtk)$

    bind = $mainMod, Return, exec, $terminal
    bind = $mainMod, E, exec, $fileManager
    bind = $mainMod, D, exec, $menu
    bind = $mainMod ALT, V, exec, rofi -modi "clipboard:cliphist-rofi" -show clipboard -kb-cancel "Escape" -theme ${constants.paths.config}/.config/rofi/config.rasi
    bind = $mainMod, H, exec, keyhint
    bind = $mainMod SHIFT, R, exec, pkill waybar; waybar

    bind = $mainMod, Q, killactive,
    bind = $mainMod, F, togglefloating,
    bind = $mainMod, P, pseudo,
    bind = $mainMod, J, togglesplit,

    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    bind = $mainMod ALT, left, movewindow, l
    bind = $mainMod ALT, right, movewindow, r
    bind = $mainMod ALT, up, movewindow, u
    bind = $mainMod ALT, down, movewindow, d

    binde = $mainMod SHIFT, right, resizeactive, 10 0
    binde = $mainMod SHIFT, left, resizeactive, -10 0
    binde = $mainMod SHIFT, up, resizeactive, 0 -10
    binde = $mainMod SHIFT, down, resizeactive, 0 10

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

    bind = $mainMod, TAB, workspace, m+1
    bind = $mainMod SHIFT, TAB, workspace, m-1
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    bind = $mainMod, M, exit,
    bind = CTRL ALT, L, exec, swaylock
    bind = CTRL ALT, P, exec, wlogout -p
    bindl= , xf86Sleep, exec, systemctl suspend

    bindel= , XF86AudioRaiseVolume, exec, pamixer -i 5
    bindel= , XF86AudioLowerVolume, exec, pamixer -d 5
    bindl= , XF86AudioMute, exec, pamixer -t
    bindl= , XF86AudioMicMute, exec, pamixer --default-source -t
    bindl= , XF86AudioPlay, exec, playerctl play-pause
    bindl= , XF86AudioNext, exec, playerctl next
    bindl= , XF86AudioPrev, exec, playerctl previous

    bind = $mainMod, S, exec, bash -c 'region=$(slurp); sleep 0.25; [ -n "$region" ] && grim -g "$region" - | wl-copy'
    bind = $mainMod CTRL, S, exec, bash -c 'region=$(slurp); sleep 0.25; [ -n "$region" ] && grim -g "$region" - | swappy -f -'
  '';
}
