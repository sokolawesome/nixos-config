{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs_24
    nil
    statix
    deadnix
    alejandra
  ];
}
