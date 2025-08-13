{ pkgs, config, ... }:

{
  imports = [
    ./modules/cli.nix
    ./modules/ui.nix
    ./modules/desktop.nix
    ./modules/packages.nix
    ./modules/scripts.nix
  ];

  home.username = "sokolawesome";
  home.homeDirectory = "/home/sokolawesome";
  home.stateVersion = "25.05";
}
