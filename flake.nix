{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak"; 
  };

  outputs = { self, nixpkgs, nix-flatpak, ... }@inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # or your system architecture
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          ./hosts/desktop.nix
        ];
      };
#      l14 = nixpkgs.lib.nixosSystem {
#        system = "x86_64-linux";
#        modules = [
#           nix-flatpak.nixosModules.nix-flatpak
#          ./hosts/l14.nix
#        ];
#      };
#      t430 = nixpkgs.lib.nixosSystem {
#        system = "x86_64-linux";
#        modules = [
#           nix-flatpak.nixosModules.nix-flatpak
#          ./hosts/t430.nix
#        ];
#      };

    };
  };
}






