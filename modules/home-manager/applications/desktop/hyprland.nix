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
    exec-once = wl-paste --type text --watch cliphist store -max-items 100
    exec-once = wl-paste --type image --watch cliphist store -max-items 100
    exec-once = wl-clip-persist --clipboard regular
    exec-once = nm-applet
    exec-once = rustdesk

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

    windowrulev2 = workspace 1 silent, class:^(firefox)$
    windowrulev2 = workspace 5 silent, class:^(org\.telegram\.desktop)$
    windowrulev2 = workspace 4 silent, class:^(rustdesk)$

    windowrulev2 = float, class:(thunar)
    windowrulev2 = float, class:(blueman-manager)
    windowrulev2 = float, class:^(nm-connection-editor)$
    windowrulev2 = float, class:^(org.kde.polkit-kde-authentication-agent-1)$
    windowrulev2 = center, class:^(org.kde.polkit-kde-authentication-agent-1)$

    windowrulev2 = float, class:^(xdg-desktop-portal-gtk)$
    windowrulev2 = size 50% 50%, class:^(xdg-desktop-portal-gtk)$
    windowrulev2 = center, class:^(xdg-desktop-portal-gtk)$

    bind = $mainMod, Return, exec, $terminal
    bind = $mainMod, E, exec, $fileManager
    bind = $mainMod, D, exec, $menu
    bind = $mainMod ALT, V, exec, rofi -modi "clipboard:cliphist-rofi" -show clipboard -kb-cancel "Escape" -theme ${constants.paths.config}/rofi/config.rasi
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

    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5

    bind = $mainMod, TAB, workspace, m+1
    bind = $mainMod SHIFT, TAB, workspace, m-1
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    bind = $mainMod, S, exec, bash -c 'region=$(slurp); sleep 0.25; [ -n "$region" ] && grim -g "$region" - | wl-copy'
    bind = $mainMod CTRL, S, exec, bash -c 'region=$(slurp); sleep 0.25; [ -n "$region" ] && grim -g "$region" - | swappy -f -'
  '';
}
