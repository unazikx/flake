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
        let
          toml = pkgs.formats.toml { };
        in
        (lib.mkMerge [
          {
            # INFO: usage
            # anicli -> anicli-ru -q 1440
            #
            # WARN: to use anilib auth follow this
            # https://github.com/vypivshiy/anicli-api/issues/42#issuecomment-2889017544
            hmPackages = [ pkgs.own.anicli-ru ];
          }

          {
            # INFO: very cool (best imho) anime watcher
            # with anilist support
            hmPackages = [ pkgs.viu ];

            hm.xdg.configFile = {
              "viu/config.toml".source = toml.generate "viu-config.toml" (
                import ./viuConfig.nix {
                  inherit
                    lib
                    config
                    ;
                }
              );

              "viu/auth.json".source = lib.mkSymlink config.sopsnix."tokens/viu";
            };
          }
        ]);
    };
}
