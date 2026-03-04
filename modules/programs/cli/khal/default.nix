# INFO:
# good calendar?
# no...not goon

{
  flake =
    {
      partsConfig,
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          ...
        }:
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              calendar
              ;
          };

          hm.programs = {
            khal = {
              enable = true;

              locale.weeknumbers = "left";
            };

            qcal.enable = true;
          };
        };
    };
}
