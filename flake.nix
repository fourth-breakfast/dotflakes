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

            # Host-specific modules
            ./hosts/bakchos/hardware/cpu.nix
            ./hosts/bakchos/hardware/gpu.nix
            ./hosts/bakchos/hardware/ssd.nix
            ./hosts/bakchos/hardware/bluetooth.nix

            ./hosts/bakchos/kernel.nix
            ./hosts/bakchos/filesystem.nix
            ./hosts/bakchos/system.nix

            # Boot
            ./common/boot/systemd-boot.nix

            # System
            ./common/system/imports.nix
            ./common/system/experimental.nix
            ./common/system/allowUnfree.nix
            ./common/system/allFirmware.nix

            # Localization
            ./common/localization/keyboard.nix
            ./common/localization/en_es-madrid.nix

            # Users
            ./common/users/andres.nix

            # Desktop environment
            ./common/desktop/wayland/compositors/sway.nix
            ./common/desktop/wayland/login/sddm.nix

            ./common/desktop/utilities/audio.nix
            ./common/desktop/utilities/battery.nix
            ./common/desktop/utilities/bluetooth.nix
            ./common/desktop/utilities/credentials.nix
            ./common/desktop/utilities/disks.nix
            ./common/desktop/utilities/networking.nix
          ];
        };
      };
    };
}
