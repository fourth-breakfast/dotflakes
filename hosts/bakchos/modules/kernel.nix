{ pkgs, ... }:

{

  boot = {
    kernelPackages = pkgs.linuxPackages_latest; # Select latest stable kernel

    # Quiet boot with splash screen
    kernelParams = [
      "quiet"
      "splash"
    ];

    # Enable Plymouth for graphical boot splash (optional)
    plymouth = {
      enable = true;
      theme = "spinner"; # Simple spinner
    };
  };

  # Enable redistributable firmware
  hardware.enableRedistributableFirmware = true;
  # hardware.enableAllFirmware = true; # Enable all firmware (including non-free)
}
