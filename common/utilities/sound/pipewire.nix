{ ... }:
{
  # Enable PipeWire audio system
  services.pipewire = {
    enable = true;
    alsa.enable = true; # ALSA compatibility
    alsa.support32Bit = true; # 32-bit app support
    pulse.enable = true; # PulseAudio compatibility
    jack.enable = true; # JACK compatibility (for pro audio)
  };

  # Real-time audio scheduling
  security.rtkit.enable = true;
}
