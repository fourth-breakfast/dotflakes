{ lib, ... }:
{
  # Specializations for different GPU modes
  specialisation = {
    # Sync mode - both GPUs active (performance)
    sync.configuration = {
      # Hardware configuration
      hardware.nvidia = {
        # Power management
        powerManagement.finegrained = lib.mkForce false; # Disable fine-grained power management

        # PRIME configuration
        prime = {
          offload.enable = lib.mkForce false; # Disable offload
          offload.enableOffloadCmd = lib.mkForce false; # Disable offload command
          sync.enable = true; # Enable sync mode
        };
      };
    };

    # AMD-only mode - Nvidia completely disabled (battery life)
    blacklist.configuration = {
      # Boot & kernel configuration
      boot = {
        # Override kernel modules - keep only non-Nvidia
        kernelModules = lib.mkForce [
          "hp-wmi" # Keep HP hardware support
        ];

        # Blacklist all Nvidia kernel modules
        blacklistedKernelModules = [
          "nvidia"
          "nvidia_drm"
          "nvidia_modeset"
          "nvidia_uvm"
        ];

        extraModprobeConfig = ''
          blacklist nvidia
          blacklist nvidia_drm
          blacklist nvidia_modeset
          blacklist nvidia_uvm
        '';
      };

      # Hardware configuration
      hardware.nvidia = lib.mkForce { }; # Disable all Nvidia configuration

      # Display drivers
      services.xserver.videoDrivers = lib.mkForce [ "amdgpu" ]; # Use only AMD drivers
    };
  };
}
