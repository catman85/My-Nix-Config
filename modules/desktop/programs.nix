{ config, pkgs, inputs, ... }:

let
  claude-desktop-fhs = inputs.claude-desktop.packages.${pkgs.system}.claude-desktop-with-fhs;
in

{
  programs.ydotool.enable = true;

  environment.systemPackages = with pkgs; [
    claude-desktop-fhs 
    lm_sensors
  ];
}
