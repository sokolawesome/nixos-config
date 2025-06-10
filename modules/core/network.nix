{ pkgs, host, ... }:

{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
      allowedUDPPorts = [ ];
    };
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
