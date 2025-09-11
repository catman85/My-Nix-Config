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

    # User-specific packages (in home-manager)
    # packages = ["com.discordapp.Discord"];

    update.onActivation = true;
    uninstallUnmanaged = false;
  };
}