{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_GB.UTF-8";

  programs.zsh.enable = true;

  services.fstrim.enable = true;

  environment.systemPackages = with pkgs; [ git git-extras wget curl ];

  users.users.sokolawesome = {
    isNormalUser = true;
    description = "sokolawesome";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
