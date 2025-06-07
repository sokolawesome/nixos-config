{
  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
      display-drun: "󰀻 Apps";
      display-window: "󰖯 Windows";
      display-clipboard: "󰅇 Clipboard";
      drun-display-format: "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
      window-format: "{w} · {c} · {t}";
      show-icons: true;
      icon-theme: "Papirus-Dark";
      font: "JetBrainsMono Nerd Font 12";
    }

    * {
      bg0: #24273a;
      bg1: #363a4f;
      bg2: #5b6078;
      bg3: #6e738d;
      fg0: #cad3f5;
      fg1: #b8c0e0;
      fg2: #a5adcb;
      accent: #89b4fa;
      urgent: #ed8796;
      
      background-color: transparent;
      text-color: @fg0;
      margin: 0;
      padding: 0;
      spacing: 0;
    }

    window {
      background-color: @bg0;
      location: center;
      width: 480;
      border-radius: 12px;
      border: 2px;
      border-color: @accent;
    }

    inputbar {
      font: "JetBrainsMono Nerd Font 14";
      padding: 12px;
      spacing: 12px;
      children: [ icon-search, entry ];
    }

    icon-search {
      expand: false;
      filename: "search";
      size: 28px;
    }

    icon-search, entry, element-icon, element-text {
      vertical-align: 0.5;
    }

    entry {
      font: inherit;
      placeholder-color: @fg2;
    }

    message {
      border: 2px 0 0;
      border-color: @bg1;
      background-color: @bg1;
    }

    textbox {
      padding: 8px 24px;
    }

    listview {
      lines: 10;
      columns: 1;
      fixed-height: false;
      border: 1px 0 0;
      border-color: @bg1;
    }

    element {
      padding: 8px 16px;
      spacing: 16px;
      background-color: transparent;
    }

    element normal active {
      text-color: @accent;
    }

    element selected normal, element selected active {
      background-color: @accent;
      text-color: @bg0;
    }

    element-icon {
      size: 1em;
    }

    element-text {
      text-color: inherit;
    }
  '';
}