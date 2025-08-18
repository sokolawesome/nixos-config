{ constants, ... }:

{
  services.qbittorrent = {
    enable = true;
    openFirewall = true;
    user = constants.user.name;
    torrentingPort = constants.ports.qbittorrent;
  };
}