{pkgs, ... }:
{
  boot = {
    # Kernel version
    kernelPackages = pkgs.linuxPackages;
    
    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    
    # Early boot modules (hardware detection)
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci" 
      "usbhid"
      "uas"
      "sd_mod"
    ];
    
    # Kernel modules (loaded after init)
    kernelModules = [
      # Hardware support
      "hp-wmi"
      
      # GPU modules
      "nvidia"
      "nvidia_drm"
      "nvidia_modeset"
      "nvidia_uvm"
    ];
    
    # Kernel command line parameters
    kernelParams = [
      # Boot experience
      "quiet"
      "splash"
      
      # CPU configuration  
      "initcall_blacklist=amd_pstate_init"
      "amd_pstate.enable=0"
    ];
  };
}