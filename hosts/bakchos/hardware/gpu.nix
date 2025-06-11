{ config, lib, ... }:
{
  boot.kernelModules = [
    "nvidia"
    "nvidia_drm"
    "nvidia_modeset"
    "nvidia_uvm"
  ];

  hardware = {
    # Graphics
    graphics.enable = true;
    nvidia = {
      # Enable stable driver (proprietary)
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      open = false; # Disable open source driver

      # Power management
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;

      # Enable nvidia-settings menu
      nvidiaSettings = true;

      prime = {
        # Set bus IDs for hybrid graphics
        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
        # Enable offload
        offload.enable = true;
        offload.enableOffloadCmd = true;
      };
    };
  };

  # Ensure iGPU gets used by default
  environment.sessionVariables = {
    DRI_PRIME = "0"; # Use AMD (card0)
    __GLX_VENDOR_LIBRARY_NAME = "mesa"; # Use Mesa/AMD drivers
    MESA_LOADER_DRIVER_OVERRIDE = "radeonsi"; # Force AMD driver
  };

  services = {
    # xorg and Wayland drivers
    xserver = {
      videoDrivers = [
        "amdgpu"
        "nvidia"
      ];
    };
  };

  # Specializations for different GPU modes
  specialisation = {
    # Sync mode - both GPUs active (performance)
    sync.configuration = {
      hardware.nvidia = {
        powerManagement.finegrained = lib.mkForce false; # Disable fine-grained power management

        prime = {
          offload.enable = lib.mkForce false; # Disable offload
          offload.enableOffloadCmd = lib.mkForce false; # Disable offload command
          sync.enable = true; # Enable sync mode
        };
      };
    };

    # AMD-only mode - Nvidia completely disabled (battery life)
    blacklist.configuration = {
      boot = {
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

      hardware.nvidia = lib.mkForce { }; # Disable all Nvidia configuration
      services.xserver.videoDrivers = lib.mkForce [ "amdgpu" ]; # Use only AMD drivers
    };
  };
}
