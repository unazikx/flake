# INFO:
# fucking dead
# RECONSRUCT WHAT???

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
          services.zapret = {
            enable = true;

            sf_presets = {
              enable = true;
              preset = "renixos";
            };
          };
        };
    };
}
