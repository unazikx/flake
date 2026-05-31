# INFO:
# export shell variables for tokens
# alias for repl and rebuild
# nurl -> prefetch repos and other

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          ...
        }:
        {
          packages = lib.attrValues {
            inherit (pkgs)
              nilla-cli
              npins
              ;
          };
        };
    };
}
