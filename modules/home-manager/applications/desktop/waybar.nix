{ constants, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [
          "clock"
          "custom/divider"
          "idle_inhibitor"
        ];
        modules-right = [
          "pulseaudio"
          "custom/divider"
          "cpu"
          "custom/divider"
          "memory"
          "custom/divider"
          "hyprland/language"
          "custom/divider"
          "tray"
        ];

        "hyprland/workspaces" = {
          on-click = "activate";
          active-only = false;
          format = "{id}";
          persistent-workspaces."*" = 5;
        };

        clock = {
          format = "{:%H:%M | %d.%m.%Y}";
          tooltip = false;
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
        };

        pulseaudio = {
          format = "VOL: {volume}%";
          format-muted = "VOL: MUT";
          scroll-step = 5;
          on-click = "pamixer -t";
          on-scroll-up = "pamixer -i 5 --allow-boost && ~/bin/hyprland/volume.sh";
          on-scroll-down = "pamixer -d 5 --allow-boost && ~/bin/hyprland/volume.sh";
          on-click-right = "pavucontrol";
          tooltip = false;
        };

        cpu = {
          interval = 5;
          format = "USAGE: {usage}%";
          on-click = "kitty -e btop";
          tooltip = false;
        };

        memory = {
          interval = 5;
          format = "RAM: {used:0.1f}G";
          on-click = "kitty -e btop";
          tooltip = false;
        };

        "hyprland/language" = {
          format-en = "EN";
          format-ru = "RU";
        };

        tray = {
          icon-size = 18;
          spacing = 10;
        };

        "custom/divider" = {
          format = " | ";
          tooltip = false;
        };
      };
    };

    style = ''
      @define-color base            #232136;
      @define-color surface         #2a273f;
      @define-color overlay         #393552;
      @define-color muted           #6e6a86;
      @define-color subtle          #908caa;
      @define-color text            #e0def4;
      @define-color love            #eb6f92;
      @define-color gold            #f6c177;
      @define-color rose            #ea9a97;
      @define-color pine            #3e8fb0;
      @define-color foam            #9ccfd8;
      @define-color iris            #c4a7e7;
      @define-color highlightLow    #2a283e;
      @define-color highlightMed    #44415a;
      @define-color highlightHigh   #56526e;

      * {
          font-family: ${constants.theme.font};
          font-size: 18px;
          font-weight: 700;
          padding: 0;
          margin: 0;
      }

      #waybar {
          color: @text;
          background-color: alpha(@surface, 0.9);
      }

      #workspaces { margin-left: 20px; }
      #tray { margin-right: 20px; }

      #workspaces button {
          box-shadow: none;
          text-shadow: none;
          background: none;
          transition: none;
          border: none;
          color: @text;
      }

      #workspaces button:hover { color: alpha(@love, 0.9); }
      #workspaces button.active { color: @rose; }

      tooltip {
          color: @text;
          background-color: alpha(@surface, 0.9);
      }
    '';
  };
}
