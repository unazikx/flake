# INFO:
# just play
# in ../../../services/minecraft/default.nix
# i have server, but tsss

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
            persistDir = ".local/share/PrismLauncher";
            configDir = "PrismLauncher/prismlauncher.cfg";
            package = pkgs.freesmlauncher;
          })
        ];
    };
}
