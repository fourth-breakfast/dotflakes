{ ... }:
{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/0ccb3c1c-1c1b-4298-a6e8-1a6bb86c9bf1";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/F560-B380";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/ed9c4a36-2909-4c30-b4a2-d2e34ac8fa5c"; }
  ];
}
