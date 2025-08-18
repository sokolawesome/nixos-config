{ constants, ... }:

{
  imports = [
    ../../modules/home-manager/applications/terminal
    ../../modules/home-manager/applications/desktop
    ../../modules/home-manager/applications/development
    ../../modules/home-manager/themes
    ./packages.nix
  ];

  home = {
    username = constants.user.name;
    homeDirectory = "/home/${constants.user.name}";
    stateVersion = "25.05";
  };
}