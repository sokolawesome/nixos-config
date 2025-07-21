{ ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "sokolawesome";
  };

  services.uptime-kuma.enable = true;
}
