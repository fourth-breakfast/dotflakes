{ ... }:
{
  services = {
    auto-cpufreq = {
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

    # TLP

    # Powertop
  };
}
