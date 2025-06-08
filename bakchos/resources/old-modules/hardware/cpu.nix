{
  # AMD CPU configuration
  hardware.cpu.amd.updateMicrocode = true; # Enable AMD CPU microcode

  # Fully disable amd_pstate
  boot.kernelParams = [
    "initcall_blacklist=amd_pstate_init"
    "amd_pstate.enable=0"
  ];

  # auto-cpufreq configuration
  services.auto-cpufreq = {
    enable = true;

    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
        # scaling_max_freq_khz = 2000000;
      };

      charger = {
        governor = "performance";
        turbo = "auto";
        # scaling_max_freq_khz = 5000000;
      };
    };
  };
}
