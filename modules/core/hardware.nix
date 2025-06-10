{ inputs, pkgs, ... }:

let
  hyprland-pkgs =
    inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  hardware = {
    graphics = {
      enable = true;
      package = hyprland-pkgs.mesa;
      extraPackages = with pkgs; [
        mesa-vulkan-drivers
        vaapiVdpau
        libvdpau-va-gl
        libva-mesa-driver
      ];
    };

    nvidia = pkgs.lib.mkIf (host == "devmachine") {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      enable32Bit = true;
      prime.offload.enable = true;
      prime.sync.enable = true;
      nvidia-container-toolkit.enable = true;
    };
  };

  hardware.enableRedistributableFirmware = true;
}
