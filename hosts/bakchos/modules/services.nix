{ ... }:
{
  services = {
    # enable TRIM
    fstrim.enable = true;

    # xorg and Wayland configuration
    xserver = {
      videoDrivers = [
        "amdgpu"
        "nvidia"
      ];

      xkb = {
        layout = "us";
        variant = "";
      };
    };

  };
}
