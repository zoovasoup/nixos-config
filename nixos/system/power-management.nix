{...}: {
  services.power-profiles-daemon = {
    enable = false;
  };

  services.tlp = {
    enable = true;
    settings = {
      TLP_DEFAULT_MODE = "bat";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_MAX_FREQ_ON_BAT = "1700000";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_BOOST_ON_BAT = 0;
      PLATFORM_PROFILE_ON_BAT = "low-power";
      RADEON_DPM_PERF_LEVEL_ON_BAT = "low";
      RADEON_DPM_STATE_ON_BAT = "battery";
      USB_AUTOSUSPEND = 0;
      START_CHARGE_THRESH_BAT0 = "70";
      STOP_CHARGE_THRESH_BAT0 = "81";
    };
  };

  # programs.auto-cpufreq = {
  #   enable = true;
  #   settings = {
  #     battery = {
  #       governor = "powersave";
  #       turbo = "never";
  #       enable_thresholds = true;
  #       start_threshold = "65";
  #       stop_threshold = "81";
  #     };
  #   };
  # };
}
