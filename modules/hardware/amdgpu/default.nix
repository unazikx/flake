{
  flake =
    {
      ...
    }:
    {
      # INFO:
      # module for amdrpu
      # drivers
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          ...
        }:
        {
          environment.variables = {
            RUSTICL_ENABLE = "radeonsi";
            ROC_ENABLE_PRE_VEGA = 1;
          };

          hardware = {
            graphics = {
              enable = true;
              enable32Bit = true;

              extraPackages = with pkgs; [ rocmPackages.clr.icd ];
            };
          };

          services.lact.enable = true;
        };
    };
}
