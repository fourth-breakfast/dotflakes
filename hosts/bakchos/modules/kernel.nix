{pkgs, ...}:

{
  # Select kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable redistributable firmware
  # hardware.enableRedistributableFirmware = true;

  # Enable all firmware (including non-free)
  hardware.enableAllFirmware = true;
}
