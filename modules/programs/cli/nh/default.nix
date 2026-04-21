# INFO:
# not bad nixos helper

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          ...
        }:
        {
          programs.nh = {
            enable = true;

            clean = {
              enable = true;
              extraArgs = lib.concatStringsSep " " [
                "--keep 3"
                "--keep-since 1week"
                "--optimise"
              ];
            };

            flake = lib.flakeDir;
          };
        };
    };
}
