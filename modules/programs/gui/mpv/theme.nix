{
  ...
}:

{
  zen.programs.gui.mpv.theme = {
    homeManager =
      {
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
        fonts = config.stylix.fonts;
      in
      {
        programs.mpv = {
          config = {
            background-color = "#000000";
            osd-back-color = colors.withHashtag.base01;
            osd-border-color = colors.withHashtag.base01;
            osd-color = colors.withHashtag.base05;
            osd-font = fonts.sansSerif.name;
            osd-shadow-color = colors.withHashtag.base00;
            sub-font = fonts.sansSerif.name;
          };

          scriptOpts.uosc.color = lib.concatStringsSep "," (
            lib.mapAttrsToList (key: value: "${key}=${value}") {
              background = colors.base00;
              background_text = colors.base05;
              curtain = colors.base0D;
              error = colors.base0F;
              foreground = colors.base05;
              foreground_text = colors.base00;
              success = colors.base0A;
            }
          );
        };
      };
  };
}
