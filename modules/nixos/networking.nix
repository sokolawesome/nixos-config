{ ... }:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8686 8920 ];
    allowedUDPPorts = [ 8686 8920 ];
  };
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  services.blueman.enable = true;
  services.tailscale.enable = true;
  services.openssh = {
    enable = true;
    openFirewall = true;
    ports = [
      2025
    ];
    settings = {
      PermitRootLogin = "no";
    };
  };
}
