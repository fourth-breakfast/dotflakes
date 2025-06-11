{
  description = "nixos system flake for the hp victus 16-s0011ns. hostname bakchos, god of wine";

  inputs = {
    # Select nixpkgs channel
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Enable auto-cpufreq flake
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      auto-cpufreq,
      ...
    }:

    {
      nixosConfigurations = {
        bakchos = nixpkgs.lib.nixosSystem {
          # Specify system architecture
          system = "x86_64-linux";

          modules = [
            # Pass required inputs to modules
            auto-cpufreq.nixosModules.default

            # Import modules
            ./bakchos/boot.nix
            ./bakchos/splash.nix

            ./bakchos/hardware.nix
            ./bakchos/specialisations.nix
            ./bakchos/battery.nix

            ./modules/nixos/system.nix
            ./bakchos/networking.nix

            ./bakchos/filesystem.nix
            ./modules/home-manager/packages.nix
          ];
        };
      };
    };
}
