{ ... }:

{
  xdg.configFile = {
    "waybar/config".text = ''
      {
          "layer": "top",
          "position": "top",
          "height": 30,
          "modules-left": ["hyprland/workspaces", "hyprland/window"],
          "modules-center": ["clock"],
          "modules-right": ["pulseaudio", "network", "cpu", "memory", "tray"],
          "hyprland/workspaces": {
              "format": "{icon}",
              "on-click": "activate"
          },
          "tray": {
              "icon-size": 18,
              "spacing": 10
          },
          "clock": {
              "format": " {:%H:%M}",
              "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
          },
          "pulseaudio": {
              "format": "{volume}% {icon}",
              "format-muted": " Muted",
              "on-click": "pamixer -t",
              "format-icons": {
                  "headphone": "",
                  "hands-free": "",
                  "headset": "",
                  "phone": "",
                  "portable": "",
                  "car": "",
                  "default": ["", ""]
              }
          },
          "network": {
              "format-wifi": "  {essid}",
              "format-ethernet": " {ifname}",
              "format-disconnected": "⚠ Disconnected"
          },
          "cpu": {
              "format": " {usage}%",
              "tooltip": true
          },
          "memory": {
              "format": " {}%"
          }
      }
    '';

    "waybar/style.css".text = ''
      * {
          border: none;
          border-radius: 0;
          font-family: JetBrainsMono Nerd Font;
          font-size: 13px;
          min-height: 0;
      }
      window#waybar {
          background: #1e1e2e;
          color: #cdd6f4;
      }
      #workspaces button {
          padding: 0 5px;
          background: transparent;
          color: #cdd6f4;
      }
      #workspaces button.active {
          color: #89b4fa;
      }
      #workspaces button:hover {
          background: #89b4fa;
          color: #1e1e2e;
      }
      #clock, #pulseaudio, #network, #cpu, #memory, #tray {
          padding: 0 10px;
      }
    '';
  };
}
