{ pkgs, ... }:

{
  services.jellyfin.enable = true;
  services.jellyfin.openFirewall = true;

  services.radarr = {
    enable = true;
    openFirewall = true;
  };
  services.sonarr = {
    enable = true;
    openFirewall = true;
  };
}
