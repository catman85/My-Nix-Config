{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # Replace "desktop" with your actual hostname
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # or your system architecture
        modules = [
          ./hosts/desktop.nix
        ];
      };
#      l14 = nixpkgs.lib.nixosSystem {
#        system = "x86_64-linux";
#        modules = [
#          ./hosts/l14.nix
#        ];
#      };
#      t430 = nixpkgs.lib.nixosSystem {
#        system = "x86_64-linux";
#        modules = [
#          ./hosts/t430.nix
#        ];
#      };

    };
  };
}






