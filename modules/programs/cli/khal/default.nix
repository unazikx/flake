# INFO:
# good calendar?
# no...not goon

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          partsConfig,
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
