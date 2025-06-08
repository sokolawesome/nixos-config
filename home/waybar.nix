{ config, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "5 10 0 10";
        height = 35;
        spacing = 5;

        modules-left = [ "custom/menu" "hyprland/window" ];
        modules-center = [ "hyprland/workspaces" "clock" ];
        modules-right = [ "pulseaudio" "network" "cpu" "memory" "tray" "custom/power" ];

        "custom/menu" = {
          format = "󰀻";
          tooltip = false;
          on-click = "rofi -show drun -theme ${config.home.homeDirectory}/.config/rofi/config.rasi";
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          all-outputs = true;
	        sort-by-number = true;
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 40;
          separate-outputs = true;
        };

        clock = {
          interval = 1;
          format = " {:%H:%M}";
          format-alt = " {:%A, %B %d, %Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰖁 {volume}%";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󱡏";
            headset = "󰋎";
            phone = "";
            portable = "";
            car = "";
            default = ["󰕿" "󰖀" "󰕾"];
          };
          scroll-step = 5;
          on-click = "pamixer -t";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
        };

        network = {
          interval = 5;
          format-wifi = "󰤨 {essid} {signalStrength}%";
          format-ethernet = "󰈀 Connected";
          format-linked = "󰈀 {ifname}";
          format-disconnected = "󰤭 Disconnected";
          tooltip-format-wifi = "󰤨 {essid}\nSignal: {signalStrength}%\nFrequency: {frequency}MHz";
          tooltip-format-ethernet = "󰈀 {ifname}\nIP: {ipaddr}";
        };

        cpu = {
          interval = 5;
          format = "󰍛 {usage}%";
          tooltip = true;
          on-click = "kitty -e htop";
        };

        memory = {
          interval = 5;
          format = "󰾆 {percentage}%";
          tooltip-format = "Memory: {used:0.1f}G / {total:0.1f}G";
          on-click = "kitty -e htop";
        };

        tray = {
          icon-size = 16;
          spacing = 8;
        };

        "custom/power" = {
          format = "󰐥";
          tooltip = false;
          on-click = "wlogout -p";
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 14px;
        min-height: 0;
        border: none;
        border-radius: 0;
      }

      window#waybar {
        background: rgba(36, 39, 58, 0.95);
        color: #cad3f5;
        border-radius: 0px;
        border: 2px solid rgba(137, 180, 250, 0.3);
        margin: 5px 10px 0 10px;
        padding: 0;
      }

      #workspaces {
        background: rgba(54, 58, 79, 0.8);
        border-radius: 0px;
        margin: 5px;
        padding: 0 8px;
      }

      #workspaces button {
        padding: 4px 8px;
        background: transparent;
        color: #a5adcb;
        border-radius: 0px;
        margin: 2px;
        transition: all 0.2s ease-in-out;
        min-width: 25px;
      }

      #workspaces button.active {
        background: rgba(137, 180, 250, 0.3);
        color: #89b4fa;
        box-shadow: inset 0 -2px 0 #89b4fa;
      }

      #workspaces button:hover {
        background: rgba(137, 180, 250, 0.2);
        color: #89b4fa;
      }

      #custom-menu {
        background: rgba(237, 135, 150, 0.8);
        color: #24273a;
        border-radius: 0px;
        margin: 5px 0 5px 5px;
        padding: 0 12px;
        font-size: 16px;
        min-width: 30px;
      }

      #custom-menu:hover {
        background: rgba(237, 135, 150, 1);
      }

      #window {
        background: rgba(54, 58, 79, 0.6);
        border-radius: 0px;
        margin: 5px;
        padding: 0 12px;
        color: #b8c0e0;
      }

      #clock {
        background: rgba(166, 218, 149, 0.8);
        color: #24273a;
        border-radius: 0px;
        margin: 5px;
        padding: 0 16px;
        font-weight: bold;
        min-width: 80px;
      }

      #pulseaudio,
      #network,
      #cpu,
      #memory,
      #tray {
        background: rgba(54, 58, 79, 0.8);
        border-radius: 0px;
        margin: 5px 2px;
        padding: 0 12px;
        color: #cad3f5;
        min-width: 60px;
      }

      #pulseaudio {
        color: #89b4fa;
      }

      #network {
        color: #8bd5ca;
      }

      #cpu {
        color: #f4dbd6;
      }

      #memory {
        color: #f0c6c6;
      }

      #custom-power {
        background: rgba(237, 135, 150, 0.8);
        color: #24273a;
        border-radius: 0px;
        margin: 5px 5px 5px 0;
        padding: 0 12px;
        font-size: 16px;
        min-width: 30px;
      }

      #custom-power:hover {
        background: rgba(237, 135, 150, 1);
      }

      tooltip {
        background: rgba(36, 39, 58, 0.95);
        border: 2px solid rgba(137, 180, 250, 0.3);
        border-radius: 0px;
        color: #cad3f5;
      }

      tooltip label {
        color: #cad3f5;
      }
    '';
  };
}
