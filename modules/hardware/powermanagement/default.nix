# INFO:
# optimization battery my thinkpadT14

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
          services = {
            upower.enable = true;
          };

          powerManagement = {
            enable = true;
            powertop.enable = true;
            cpuFreqGovernor = "powersave";
          };
        };
    };
}
