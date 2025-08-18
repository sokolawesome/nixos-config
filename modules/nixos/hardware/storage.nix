{ constants, ... }:

{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/c09a6413-51ef-4541-af3f-d3833b2a7ee5";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/B6E5-241C";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    "${constants.paths.media}" = {
      device = "/dev/disk/by-uuid/F855-1CAC";
      fsType = "exfat";
      options = [ "noatime" "uid=1000" "gid=1000" "mode=0775" ];
    };
  };

  swapDevices = [ ];
}