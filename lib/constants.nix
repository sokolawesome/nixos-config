{
  user = {
    name = "sokolawesome";
    email = "sokolawesome@gmail.com";
    description = "sokolawesome";
  };

  paths = {
    config = "/home/sokolawesome/.config";
    assets = "/home/sokolawesome/.nixos-config";
    media = "/mnt/hdd";
    music = "/mnt/hdd/music";
  };

  ports = {
    ssh = 2025;
    uptime-kuma = 3001;
    qbittorrent = 15151;
  };

  theme = {
    font = "CaskaydiaCove Nerd Font";
    iconTheme = "Papirus-Dark";
    wallpaper = "wallpaper.png";
  };

  monitor = {
    primary = "HDMI-A-1,2560x1440@100,0x0,1";
    fallback = ",preferred,auto,1";
  };
}
