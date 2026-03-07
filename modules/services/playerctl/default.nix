# INFO:
# mpris controller

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
          hm.services.playerctld = {
            enable = true;
          };
        };
    };
}
