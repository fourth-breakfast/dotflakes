{ config, lib, ... }:

{
  # Enable boot modules
  boot.initrd.kernelModules = [
    "nvidia"
    "nvidia_drm" # Direct rendering manager
    "nvidia_modeset" # Kernel modesetting
    # "nvidia_uvm" # Unified virtual memory (for CUDA)
  ];

  # Enable OpenGL/graphics
  hardware.graphics.enable = true;

  # Enable Xorg and Wayland drivers
  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  hardware.nvidia = {
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

  # Specializations
  specialisation = {
    # Sync specialisation
    sync.configuration = {
      hardware.nvidia.prime = {
        offload.enable = lib.mkForce false; # Disable offload
        sync.enable = true; # Enable sync
      };
    };

    # Blacklist specialisation
    blacklist.configuration = {
      hardware.nvidia = lib.mkForce { }; # Disable offload logic
      services.xserver.videoDrivers = lib.mkForce [ "amdgpu" ]; # Remove Nvidia video drivers

      # Blacklist Nvidia drivers
      boot.blacklistedKernelModules = [
        "nvidia"
        "nvidia_drm"
        "nvidia_modeset"
        "nvidia_uvm"
      ];
      boot.extraModprobeConfig = ''
        blacklist nvidia
        blacklist nvidia_drm
        blacklist nvidia_modeset
        blacklist nvidia_uvm
      '';
    };
  };
}
