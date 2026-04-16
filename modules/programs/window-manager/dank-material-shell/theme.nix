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
          # keep-sorted start block=yes
          background = base01;
          backgroundText = base05;
          error = base08;
          info = base0C;
          name = "Stylix-${name}";
          outline = base03;
          primary = base0E;
          primaryContainer = base0C;
          primaryText = base00;
          secondary = base01;
          surface = base00;
          surfaceContainer = base00;
          surfaceContainerHigh = base02;
          surfaceContainerHighest = base03;
          surfaceText = base05;
          surfaceTint = base0E;
          surfaceVariant = base02;
          surfaceVariantText = base04;
          warning = base0A;
          # keep-sorted end
        })
    )
  );
}
