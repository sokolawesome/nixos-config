{ pkgs, ... }:

{
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  services.blueman.enable = true;
  services.tailscale.enable = true;
  services.jellyfin.enable = true;
  services.jellyfin.openFirewall = true;
}
