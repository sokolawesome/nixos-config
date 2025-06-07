{ pkgs, ... }:

{
  programs.hyprland.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  programs.firefox.enable = true;
}
