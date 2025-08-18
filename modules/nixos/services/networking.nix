{ constants, ... }:

{
  networking = {
    hostName = "homelab";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ constants.ports.trilium constants.ports.uptime-kuma ];
      allowedUDPPorts = [ constants.ports.trilium constants.ports.uptime-kuma ];
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
