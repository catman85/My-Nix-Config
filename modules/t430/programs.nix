{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
 lm_sensors
reaper
tor-browser
];

}
