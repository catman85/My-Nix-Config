{ config, pkgs, ... }:

{
  imports = [
    ../hardware/t430-configuration.nix
    ../modules/programs.nix
    ../modules/services.nix
  ];

  networking.hostName = "t430";
  # Laptop-specific configuration
}
