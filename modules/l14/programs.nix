{ config, pkgs, ... }:

let
  claude-desktop-fhs = inputs.claude-desktop.packages.${pkgs.system}.claude-desktop-with-fhs;
in

{
  nixpkgs.config.allowUnfree = true;
  
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # GameMode is a daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS and/or a game process.
  # type inside steam game properties gamemoderun %command%
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    claude-desktop-fhs
    lm_sensors
    jetbrains.clion
    jetbrains.webstorm
    jetbrains.pycharm
    reaper
    qemu
    quickemu
    tor-browser
    github-desktop
    distrobox
    python313
    python313Packages.virtualenv #tool to create isolated python environments
    python313Packages.pip # pip tool
    nodejs_22
  ];
}
