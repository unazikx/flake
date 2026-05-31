# INFO:
# nix-packaged games

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
          persist.user.directories = [
            ".strom"
          ];

          hm.imports = [ ./module.nix ];
        };
    };
}
