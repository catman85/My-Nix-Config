{ config, pkgs, inputs, ... }:

let
  claude-desktop-fhs = inputs.claude-desktop.packages.${pkgs.system}.claude-desktop-with-fhs;
in

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    claude-desktop-fhs 
    claude-code
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
