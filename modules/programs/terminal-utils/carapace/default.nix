# INFO:
# multi-shell multi-command argument completer

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
          hm.programs.carapace = {
            enable = true;
          };
        };
    };
}
