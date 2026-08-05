{
  ...
}:

{
  zen.programs.desktop.scroll.specific = {
    homeManagerNixos =
      {
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
      in
      {
        wayland.windowManager.scroll = {
          config = {
            animations = {
              enable = false;
              style = "scale";
            };

            window = {
              borderRadius = 12;

              shadow = {
                enable = false;
              };

              dim = {
                enable = true;
                color = "${colors.base00}cc";
              };
            };

            snap = {
              gap = {
                window = 10;
                workspace = 10;
              };

              respectGaps = {
                inner = true;
                outer = true;
              };
            };

            jump = {
              keys = "asdfghjkl";

              labels = {
                background = "${colors.base01}ff";
                color = "${colors.base05}ff";
                swallow = true;
              };
            };
          };
        };
      };
  };
}
