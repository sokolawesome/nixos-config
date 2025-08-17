{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs_24
    nil
    nixd
    statix
    deadnix
    nixfmt-classic
  ];
}
