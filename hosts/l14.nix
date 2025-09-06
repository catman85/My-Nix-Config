{ config, pkgs, ... }:

{
  imports = [
    ../hardware/l14-hardware.nix
    ../modules/programs.nix
    ../modules/services.nix
  ];

  networking.hostName = "l14";
  # Laptop-specific configuration
}
