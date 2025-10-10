{ pkgs, ... }:

{
  virtualisation = {
    containers.enable = true;
    docker = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    lazydocker
  ];
}
