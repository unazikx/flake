# INFO:
# fork prism launcher with alt auth servers:
#   - https://ely.by (recommend)
#   - https://github.com/Noctilune/ShatteredPrism/blob/develop/doc/alternative-auth-servers.md

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
          config,
          ...
        }:
        lib.mkMerge [
          (import ../prism-generator.nix {
            inherit pkgs lib config;
            persistDir = ".local/share/ShatterredPrism";
            configDir = "ShatterredPrism/shatteredprism.cfg";
            package = pkgs.shatteredprism;
          })
          { }
        ];
    };
}
