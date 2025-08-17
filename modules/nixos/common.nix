{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_GB.UTF-8";

  programs.fish.enable = true;

  services.fstrim.enable = true;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings.auto-optimise-store = true;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libva
      libva-utils
      mesa
    ];
  };

  environment.systemPackages = with pkgs; [ git wget curl exfat ];

  users.users.sokolawesome = {
    isNormalUser = true;
    description = "sokolawesome";
    extraGroups = [
      "networkmanager"
      "wheel"
      "jellyfin"
      "navidrome"
      "video"
      "render"
    ];
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
