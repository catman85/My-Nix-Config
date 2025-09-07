{ config, pkgs, ... }:

{
  imports = [
    ../hardware/l14-hardware.nix
    ../modules/shared-programs.nix
    ../modules/shared-services.nix
    ../modules/l14/programs.nix
    ../modules/l14/services.nix
  ];

  networking.hostName = "l14";
  # Laptop-specific configuration
}
