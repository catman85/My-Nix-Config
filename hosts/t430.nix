{ config, pkgs, ... }:

{
  imports = [
    ../hardware/t430-hardware.nix
    ../modules/shared-programs.nix
    ../modules/shared-services.nix
    ../modules/t430/programs.nix
    ../modules/t430/services.nix
  ];

  networking.hostName = "t430";
  # Laptop-specific configuration
}
