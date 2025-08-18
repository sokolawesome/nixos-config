{ constants, ... }:

{
  services = {
    jellyfin = {
      enable = true;
      openFirewall = true;
      user = constants.user.name;
    };

    navidrome = {
      enable = true;
      openFirewall = true;
      user = constants.user.name;
      settings = {
        MusicFolder = constants.paths.music;
        Address = "0.0.0.0";
      };
    };
  };
}