{ constants, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        format = "<b>%s</b>\\n%b";
        font = "${constants.theme.font} 16";
        follow = "mouse";
      };
      urgency_low = {
        background = "#363a4f";
        foreground = "#cad3f5";
      };
      urgency_normal = {
        background = "#363a4f";
        foreground = "#cad3f5";
      };
      urgency_critical = {
        background = "#ed8796";
        foreground = "#24273a";
        frame_color = "#ee99a0";
      };
    };
  };
}