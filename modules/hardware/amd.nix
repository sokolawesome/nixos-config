{ inputs, pkgs, ... }:

let
  hyprland-pkgs =
    inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      package = hyprland-pkgs.mesa;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        libva
        libva-utils
      ];
    };

    enableRedistributableFirmware = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
