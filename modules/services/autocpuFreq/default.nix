# INFO:
# idk auto sets cpu frequenct
# and max tick

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          services.auto-cpufreq = {
            enable = true;

            settings = {
              charger = {
                governor = "powersave";
                turbo = "auto";
              };

              battery = {
                governor = "powersave";
                turbo = "auto";
                energy_perf_bias = "balance_power";
                platform_profile = "low-power";
                enable_thresholds = true;
              };
            };
          };
        };
    };
}
