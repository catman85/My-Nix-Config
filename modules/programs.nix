{ config, pkgs, ... }:

{

  # Install firefox.
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    # Add your common packages here
  ];

  services = {
    openssh.enable = true;
    # Other shared services
  };
}
