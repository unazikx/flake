{
  lib,
  config,
  ...
}:

let
  colors = config.lib.stylix.colors;
  fonts = config.stylix.fonts.sansSerif.name;
in

{
  conf = with colors.withHashtag; {
    background-color = "#000000";
    osd-back-color = base01;
    osd-border-color = base01;
    osd-color = base05;
    osd-font = fonts;
    osd-shadow-color = base00;
    sub-font = fonts;
  };

  uosc.uosc.color =
    with colors;
    lib.concatMapAttrsStringSep "," (name: value: "${name}=${value}") {
      background = base00;
      background_text = base05;
      curtain = base0D;
      error = base0F;
      foreground = base05;
      foreground_text = base00;
      success = base0A;
    };
}
