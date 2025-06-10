{ inputs, pkgs, host, config, ... }:

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
        mesa-vulkan-drivers
        vaapiVdpau
        libvdpau-va-gl
        libva-mesa-driver
      ];
    };
  };
}
