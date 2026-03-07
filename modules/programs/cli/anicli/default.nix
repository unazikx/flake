# INFO:
# anime scrappers/watchers
#
# WARN:
# replaced to rezka-fzf

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          inputs,
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
            hmPackages = [ inputs.viu.packages.${pkgs.system}.default ];

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
