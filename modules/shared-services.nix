{ config, pkgs, ... }:


{
  imports = [
    ./flatpak-module.nix
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.blueman.enable = true;
}
