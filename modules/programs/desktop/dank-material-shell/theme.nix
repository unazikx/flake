{
  ...
}:

{
  zen.programs.desktop.dank-material-shell.theme = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
        json = pkgs.formats.json { };
      in
      {
        programs.dank-material-shell = {
          settings.customThemeFile = lib.mkForce (
            json.generate "dank-material-shell-theme.json" {
              name = "Stylix-${config.stylix.polarity}";
              # keep-sorted start block=yes
              background = colors.base01;
              backgroundText = colors.base05;
              error = colors.base08;
              info = colors.base0C;
              outline = colors.base03;
              primary = colors.base0E;
              primaryContainer = colors.base0C;
              primaryText = colors.base00;
              secondary = colors.base01;
              surface = colors.base00;
              surfaceContainer = colors.base00;
              surfaceContainerHigh = colors.base02;
              surfaceContainerHighest = colors.base03;
              surfaceText = colors.base05;
              surfaceTint = colors.base0E;
              surfaceVariant = colors.base02;
              surfaceVariantText = colors.base04;
              warning = colors.base0A;
              # keep-sorted end
            }
          );
        };
      };
  };
}
