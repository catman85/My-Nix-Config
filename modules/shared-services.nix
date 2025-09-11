{ config, pkgs, ... }:


{
  imports = [
    "./flatpak-module.nix"
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

}
