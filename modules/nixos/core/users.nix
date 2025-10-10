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
      "docker"
      "video"
      "render"
      "calibre"
    ];
    shell = pkgs.fish;
  };
}
