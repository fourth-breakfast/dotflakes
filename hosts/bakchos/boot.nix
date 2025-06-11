{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages;

    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "usbhid"
      "uas"
      "sd_mod"
    ];

    kernelModules = [
      "hp-wmi"
    ];
  };
}
