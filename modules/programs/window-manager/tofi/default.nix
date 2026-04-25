# INFO:
# just GOAT launcher

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          config,
          ...
        }:
        {
          hm.programs.tofi = {
            enable = true;

            settings = lib.mkMerge [
              {
                history = false;
                hide-cursor = true;
                text-cursor = true;

                font = config.stylix.fonts.sansSerif.name;

                width = "100%";
                height = "100%";

                border-width = 0;
                outline-width = 0;

                padding-left = "30%";
                padding-right = "30%";
                padding-top = "20%";
                padding-bottom = "20%";

                result-spacing = 25;
                num-results = 9;
              }
              (with config.lib.stylix.colors.withHashtag; {
                background-color = base00;
                text-color = base05;

                prompt-color = base04;
                input-color = base04;
                selection-color = base0E;
                default-result-color = base03;

                selection-background = base01;
                selection-background-padding = 8;
                selection-background-corner-radius = 18;
              })
            ];
          };
        };
    };
}
