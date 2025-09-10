{ config, pkgs, ... }:

let
  nix-flatpak = import (builtins.fetchTarball "https://github.com/gmodena/nix-flatpak/archive/main.tar.gz") {};
in
{
  imports = [
    nix-flatpak.nixosModules.nix-flatpak
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.blueman.enable = true;

  services.flatpak.enable = true;
  # systemd.services.flatpak-repo = {
  #   wantedBy = [ "multi-user.target" ];
  #   path = [ pkgs.flatpak ];
  #   script = ''
  #     flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  #   '';
  # };
  services.flatpak.remotes = [
    { name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo"; }
  ];
  services.flatpak.packages = [
    "com.simplenote.Simplenote"
    "com.viber.Viber"
  ];
}
