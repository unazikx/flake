# INFO:
# good calendar?
# no...not goon

{
  flake =
    {
      _config,
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
            inherit (_config.nixosModules)
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
