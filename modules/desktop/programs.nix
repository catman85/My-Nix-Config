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
    quickemu
    tor-browser
    github-desktop
    distrobox
    python313
    python313Packages.virtualenv #tool to create isolated python environments
    python313Packages.pip # pip tool
    nodejs_22
    gimp

    # for macOS KVM
    qemu_kvm          # qemu-system
    guestfs-tools     # libguestfs-tools (virt-* commands)
    tesseract         # tesseract-ocr + tesseract-ocr-eng
    # end for macOS KVM
  ];
}
