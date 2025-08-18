{ pkgs, constants, ... }:

{
  programs.fish.enable = true;

  users.users.${constants.user.name} = {
    isNormalUser = true;
    description = constants.user.description;
    extraGroups = [
      "networkmanager"
      "wheel"
      "jellyfin"
      "navidrome"
      "video"
      "render"
      "qbittorrent"
    ];
    shell = pkgs.fish;
  };
}