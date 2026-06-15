# INFO:
# driver for fingerprinting
# pam and maybe something else

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          ...
        }:
        {
          persist.directories = [
            "/var/lib/fprint"
          ];

          services.fprintd = {
            enable = true;
            package = pkgs.fprintd;
          };
        };
    };
}
