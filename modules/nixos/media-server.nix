{ ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "sokolawesome";
  };

  services.navidrome = {
    enable = true;
    openFirewall = true;
    user = "sokolawesome";
    settings = {
      MusicFolder = "/mnt/hdd/music";
    };
  };

  services.uptime-kuma.enable = true;
}
