{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    lm_sensors
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # GameMode is a daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS and/or a game process.
  # type inside steam game properties gamemoderun %command%
  programs.gamemode.enable = true;
}
