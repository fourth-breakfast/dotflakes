{
  description = "nixos system flake for the hp victus 16-s0011ns. hostname: bakchos, the god of wine";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    {
      nixosConfigurations.bakchos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/          
        ];
      };
    };
}
