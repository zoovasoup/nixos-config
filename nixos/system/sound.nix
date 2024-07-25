{pkgs, ...}: {
  # Enable sound with pipewire.
  # sound.enable = true;

  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;

    extraConfig = {
      pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 44100;
          "default.clock.quantum" = 512;
          "default.clock.min-quantum" = 512;
          "default.clock.max-quantum" = 512;
        };
      };

      # "pipewire-pulse" = {
      #   "context.modules" = [
      #     {
      #       name = "libpipewire-module-session-manager";
      #       args = {
      #         "audio.volume-limit" = 100;
      #       };
      #     }
      #   ];
      # };
    };
  };

  environment.systemPackages = with pkgs; [alsa-utils pulsemixer pavucontrol];
}
