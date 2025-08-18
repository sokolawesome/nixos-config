{ ... }:

{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings.auto-optimise-store = true;
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}