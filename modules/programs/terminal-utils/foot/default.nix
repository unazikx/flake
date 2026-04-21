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
          ...
        }:
        {
          hm.programs.foot = {
            enable = true;

            settings = {
              main = {
                bold-text-in-bright = "no";
                box-drawings-uses-font-glyphs = "yes";
                font-size-adjustment = 1.3;
                letter-spacing = 0;
                pad = "20x20 center";
                resize-by-cells = "yes";
              };

              bell.system = "no";

              cursor = {
                style = "block";
                unfocused-style = "none";
              };
            };
          };
        };
    };
}
