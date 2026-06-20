# INFO:
# opensource fronrend for pinerest

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          config,
          ...
        }:
        {
          services.binternet = {
            enable = true;

            package =
              # INFO:
              # override only for theming
              with config.lib.stylix.colors.withHashtag;
              pkgs.binternet.overrideAttrs (_old: {
                fixupPhase = ''
                  substituteInPlace $out/misc/style-dark.css \
                    --replace-fail \
                      '--accent-color: #12e8b9;' '--accent-color: ${base0E};' \
                    --replace-fail \
                      '--fg-color: white;' '--fg-color: ${base05};' \
                    --replace-fail \
                      '--border-color: rgb(97, 97, 97);' '--border-color: ${base02};' \
                    --replace-fail \
                      '--main: #2a2b2b;' '--main: ${base00};' \
                    --replace-fail \
                      '--main-second: #1f2120;' '--main-second: ${base01};' \
                    --replace-fail \
                      'font-family: verdana, arial, sans-serif;' 'font-family: ${config.stylix.fonts.sansSerif.name};'
                '';
              });
          };
        };
    };
}
