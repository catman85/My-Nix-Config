# Personal Nix Flakes Configuration

To install this setup:

1. Clone this repo in your home folder under ```~/nix-config/```
```sh
git clone https://github.com/catman85/My-Nix-Config.git
```
2. Generate your hardware config, and match the filename with whatever is specified inside ```hosts/*.nix``` file
```sh
# Here we are generating our desktop machine
nixos-generate-config --dir ~/nixos-config/hardware/desktop.hardware.nix
```
> Make sure the name of the hardware file matches what is specified inside the hosts folder. The hardware file is generated, however nixos needs to track it in git, in order to recognize it.

3. Rebuild your system to the new config.
```sh
# We select the desktop output from the flake.nix file
sudo nixos-rebuild switch --flake ~/nix-config#desktop
```
This command will trigger the entry point ```~/nix-config/flake.nix``` and run the specified output (#desktop in our case).
