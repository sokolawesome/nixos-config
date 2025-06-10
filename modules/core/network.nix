{ pkgs, host, ... }:

{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    firewall.enable = false;
    firewalld = {
      enable = true;
      zones = {
        trusted = {
          interfaces = [ "tailscale0" ];
          trusted = true;
        };
      };
      enableZones = true;
    };
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    firewalld
    firewalld-gui
  ];
}
