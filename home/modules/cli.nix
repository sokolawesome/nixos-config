{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "xiong-chiamiov-plus";
      plugins = [ "git" ];
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  programs.git = {
    enable = true;
    userName = "sokolawesome";
    userEmail = "sokolawesome@gmail.com";
    extraConfig = { init.defaultBranch = "main"; };
  };

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
      os.edit = "vscode";
    };
  };
}
