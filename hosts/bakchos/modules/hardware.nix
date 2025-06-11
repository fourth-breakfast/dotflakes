{ config, modulesPath, ... }:
{
  # Imports
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  services = {
    # Enable TRIM
    fstrim.enable = true;

    # xorg and Wayland drivers
    xserver = {
      videoDrivers = [
        "amdgpu"
        "nvidia"
      ];
    };
  };

  # Hardware
  hardware = {
    # Firmware
    # enableRedistributableFirmware = true;
    enableAllFirmware = true; # Enable all firmware (including non-free)

    # CPU
    cpu.amd.updateMicrocode = true; # Enable AMD CPU microcode

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

    # Connectivity & peripherals
    bluetooth.enable = true; # enables support for Bluetooth
    # bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };
}
