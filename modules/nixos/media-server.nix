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
      Address = "0.0.0.0";
    };
  };

  services.uptime-kuma.enable = true;
}
