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
          persist.directories = [ "/var/lib/fprint" ];

          services.fprintd = {
            enable = true;
            package = pkgs._2411.fprintd-tod;

            tod = {
              enable = true;
              driver = pkgs._2411.libfprint-2-tod1-vfs0090;
            };
          };
        };
    };
}
