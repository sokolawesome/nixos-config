{ ... }:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 6101 6102 6103 ];
  };
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
  services.blueman.enable = true;
  services.tailscale.enable = true;
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
    };
  };
}
