{
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;
let
  font = config.stylix.fonts.sansSerif.name;
  edge = "top";
in

{
  "<config>" = {
    inherit
      edge
      font
      ;
  };
  green = {
    inherit edge;
    background = base0B;
    text = base00;
    border = base01;
    button-background = base0C;
    button-text = base00;
    message-padding = 10;
  };
  warning = {
    background = base08;
    text = base00;
    border = base01;
    button-background = base09;
    button-text = base00;
    message-padding = 10;
  };
}
