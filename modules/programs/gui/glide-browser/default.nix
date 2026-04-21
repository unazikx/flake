# INFO:
# one of the best browsers ever
# now with vi keys yeeee

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
          settings = import ./settings.nix {
            inherit
              lib
              config
              ;
          };
        in
        {
          persist.user.directories = [
            ".config/glide/glide"
          ];

          hm.programs.glide-browser = {
            enable = true;

            inherit (settings)
              policies
              ;

            profiles.${lib.userName} = {
              settings = settings.profile;

              extensions = {
                force = true;

                settings = settings.extensions;
                packages = import ./extensions.nix {
                  inherit
                    pkgs
                    lib
                    config
                    ;
                };
              };

              userChrome = lib.readFile pkgs.own.firefox-themes.little-fox;

              extraConfig = lib.concatStringsSep "\n" (
                map (file: lib.readFile file) [
                  # keep-sorted start
                  "${inputs.betterfox}/Fastfox.js"
                  "${inputs.betterfox}/Peskyfox.js"
                  "${inputs.betterfox}/Securefox.js"
                  "${inputs.betterfox}/Smoothfox.js"
                  "${inputs.betterfox}/user.js"
                  # keep-sorted end
                ]
              );
            };
          };
        };
    };
}
