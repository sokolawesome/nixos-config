{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dotnet-sdk_9
    aspnet-runtime_9
    go
    rustup
  ];
}
