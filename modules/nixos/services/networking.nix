{ constants, ... }:

{
  networking = {
    hostName = "homelab";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        constants.ports.uptime-kuma
        constants.ports.qbittorrent
      ];
      allowedUDPPorts = [
        constants.ports.uptime-kuma
        constants.ports.qbittorrent
      ];
    };
  };

  services = {
    openssh = {
      enable = true;
      openFirewall = true;
      ports = [ constants.ports.ssh ];
      settings.PermitRootLogin = "no";
    };

    tailscale.enable = true;
    blueman.enable = true;
  };

  programs.nm-applet.enable = true;
}
