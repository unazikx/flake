# INFO:
# minimal native wayland terminal
# very strange font and colors

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          config,
          ...
        }:
        {
          hm.programs.foot = {
            enable = true;

            settings = {
              main = {
                bold-text-in-bright = "no";
                box-drawings-uses-font-glyphs = "yes";
                font-size-adjustment = 1;
                letter-spacing = 0;
                pad = "20x20 center";
                resize-by-cells = "yes";
              };

              bell.system = "no";

              cursor = with config.lib.stylix.colors; {
                style = "block";
                color = "${base00} ${base06}";
                unfocused-style = "none";
              };
            };
          };
        };
    };
}
