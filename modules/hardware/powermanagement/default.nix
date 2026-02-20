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
            cpupower-gui.enable = true;
          };

          powerManagement = {
            enable = true;
            powertop.enable = true;
            cpuFreqGovernor = "powersave";
          };
        };
    };
}
