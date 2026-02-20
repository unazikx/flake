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
        {
          hm.programs.waybar = {
            enable = true;
            systemd.enable = true;

            style = import ./style.nix {
              inherit
                config
                ;
            };

            settings = import ./settings.nix {
              inherit
                pkgs
                lib
                config
                ;
            };
          };
        };
    };
}
