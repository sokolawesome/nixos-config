{ constants, ... }:

{
  services = {
    jellyfin = {
      enable = true;
      openFirewall = true;
      user = constants.user.name;
    };

    calibre-server = {
      enable = true;
      user = constants.user.name;
      group = "calibre";
      port = constants.ports.calibre;
      openFirewall = true;
      libraries = [
        constants.paths.books
      ];
    };
  };
}
