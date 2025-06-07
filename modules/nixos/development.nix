{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ dotnet-sdk_9 go rustup ];
}
