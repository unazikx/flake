{
  lib,
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;
let
  background = base00;
  color = colorBase: {
    inherit background;
    border = colorBase;
    childBorder = colorBase;
    indicator = colorBase;
    text = base05;
  };
in

lib.mkForce {
  inherit background;
  focused = color base0E;
  focusedInactive = color base01;
  unfocused = color base01;
  urgent = color base08;
  placeholder = color base01;
}
