# INFO:
# just visualizer

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
          hm.programs.cava.enable = true;
        };
    };
}
