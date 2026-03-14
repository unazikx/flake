{
  pkgs,
  lib,
  config,
  ...
}:

{
  customThemeFile = lib.mkForce (
    let
      json = pkgs.formats.json { };
    in
    json.generate "dankMaterialShell-stylix-color-theme.json" (
      with config.lib.stylix.colors.withHashtag;
      lib.genAttrs
        [
          "dark"
          "light"
        ]
        (name: {
          name = "Stylix-${name}";
          primary = base0E;
          primaryText = base00;
          primaryContainer = base0C;

          secondary = base01;

          surface = base00;
          surfaceText = base05;
          surfaceVariant = base02;
          surfaceVariantText = base04;
          surfaceTint = base0E;

          background = base01;
          backgroundText = base05;

          outline = base03;

          surfaceContainer = base00;
          surfaceContainerHigh = base02;
          surfaceContainerHighest = base03;

          error = base08;
          warning = base0A;
          info = base0C;
        })
    )
  );
}
