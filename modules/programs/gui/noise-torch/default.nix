# INFO:
# noise suppressor

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
          programs.noisetorch = {
            enable = true;
          };
        };
    };
}
