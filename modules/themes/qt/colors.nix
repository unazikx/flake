{
  pkgs,
  config,
  ...
}:

with config.lib.stylix.colors;
let
  f = "#ff";
  e = "#8f";
in

((pkgs.formats.ini { }).generate "stylix.conf" {
  ColorScheme = {
    active_colors = builtins.concatStringsSep ", " [
      (f + base05)
      (f + base01)
      (f + base01)
      (f + base05)
      (f + base03)
      (f + base04)
      (f + base05)
      (f + base06)
      (f + base05)
      (f + base01)
      (f + base00)
      (f + base03)
      (f + base02)
      (f + base05)
      (f + base09)
      (f + base08)
      (f + base02)
      (f + base05)
      (f + base01)
      (f + base0E)
      (e + base0E)
    ];

    disabled_colors = builtins.concatStringsSep ", " [
      (f + base04)
      (f + base01)
      (f + base01)
      (f + base05)
      (f + base03)
      (f + base04)
      (f + base04)
      (f + base04)
      (f + base04)
      (f + base01)
      (f + base00)
      (f + base03)
      (f + base02)
      (f + base05)
      (f + base09)
      (f + base08)
      (f + base02)
      (f + base05)
      (f + base01)
      (f + base0E)
      (e + base0E)
    ];

    inactive_colors = builtins.concatStringsSep ", " [
      (f + base04)
      (f + base01)
      (f + base01)
      (f + base05)
      (f + base03)
      (f + base04)
      (f + base04)
      (f + base04)
      (f + base04)
      (f + base01)
      (f + base00)
      (f + base03)
      (f + base02)
      (f + base05)
      (f + base09)
      (f + base08)
      (f + base02)
      (f + base05)
      (f + base01)
      (f + base0E)
      (e + base0E)
    ];
  };
})
