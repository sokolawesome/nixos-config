{ ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        nerdFonts = true;
        theme = {
          activeBorderColor = [ "#89b4fa" "bold" ];
          selectedLineBgColor = [ "#45475a" ];
          optionsTextColor = [ "#89b4fa" ];
        };
      };
      os.edit = "zeditor";
    };
  };
}