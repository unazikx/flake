{
  ...
}:

{
  zen.services.tlp = {
    description = ''
      idk...fr...just to be
    '';

    nixos =
      {
        ...
      }:
      {
        services.tlp = {
          enable = true;

          settings = {
            # keep-sorted start block=yes
            AMDGPU_ABM_LEVEL_ON_AC = 0;
            AMDGPU_ABM_LEVEL_ON_BAT = 3;
            CPU_BOOST_ON_AC = 1;
            CPU_BOOST_ON_BAT = 0;
            CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
            CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MAX_PERF_ON_BAT = 40;
            CPU_MIN_PERF_ON_AC = 0;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_SCALING_GOVERNOR_ON_AC = "powersave";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
            MEM_SLEEP_ON_AC = "deep";
            MEM_SLEEP_ON_BAT = "deep";
            NMI_WATCHDOG = 0;
            PLATFORM_PROFILE_ON_AC = "performance";
            PLATFORM_PROFILE_ON_BAT = "balanced";
            RADEON_DPM_PERF_LEVEL_ON_AC = "high";
            RADEON_DPM_PERF_LEVEL_ON_BAT = "low";
            RADEON_DPM_STATE_ON_AC = "performance";
            RADEON_DPM_STATE_ON_BAT = "battery";
            RADEON_POWER_PROFILE_ON_AC = "high";
            RADEON_POWER_PROFILE_ON_BAT = "mid";
            RUNTIME_PM_ON_AC = "auto";
            RUNTIME_PM_ON_BAT = "auto";
            START_CHARGE_THRESH_BAT0 = 95;
            STOP_CHARGE_THRESH_BAT0 = 100;
            TLP_DEFAULT_MODE = "BAT";
            USB_AUTOSUSPEND = 0;
            WIFI_PWR_ON_AC = "on";
            WIFI_PWR_ON_BAT = "on";
            WOL_DISABLE = "Y";
            # keep-sorted end
          };
        };
      };
  };
}
