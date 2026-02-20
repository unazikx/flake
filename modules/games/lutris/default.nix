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
          persist.user.directories = [ ".config/lutris" ];

          hm.programs.lutris = {
            enable = true;

            defaultWinePackage = pkgs.proton-ge-bin;
            steamPackage = config.programs.steam.package;

            protonPackages = lib.attrValues {
              inherit (pkgs) proton-ge-bin;
            };
          };
        };
    };
}
