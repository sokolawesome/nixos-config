{ constants, ... }:

{
  services.trilium-server = {
      enable = true;
      port = constants.ports.trilium;
      host = "0.0.0.0";
    };
}