{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      # Replace "myhostname" with your actual hostname
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; # or your system architecture
        modules = [
          ./configuration.nix
          # Add additional modules here if needed
        ];
      };
    };
  };
}
