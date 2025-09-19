# Full example combining system and user packages
{ config, pkgs, ... }:

{
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    # System-wide packages
    packages = [
      "com.simplenote.Simplenote"
      "com.viber.Viber"
    ];

    update.onActivation = true;
    uninstallUnmanaged = false;
  };
}