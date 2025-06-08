{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dotnet-sdk_9
    omnisharp-roslyn
    go
    rustup
    nodejs_24
    statix
    deadnix
    alejandra ];
}
