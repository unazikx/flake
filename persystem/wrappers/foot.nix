{
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      legacyPackages.${baseNameOf ./.} = {
        foot =
          (pkgs.wrappers.foot.apply {
            inherit pkgs;

            settings = {
              main = {
                bold-text-in-bright = "no";
                box-drawings-uses-font-glyphs = "yes";
                font-size-adjustment = 1;
                letter-spacing = 0;
                pad = "20x20 center";
                resize-by-cells = "yes";
                dpi-aware = "yes";
              };

              bell.system = "no";
            };
          }).wrapper;
      };
    };
}
