{
  zen,
  ...
}:

{
  zen.styles.matulix = {
    includes = [
      zen.styles.matugen
      zen.styles.stylix
    ];

    excludes = [
      zen.custom.stylix
    ];

    nixos =
      {
        lib,
        config,
        ...
      }:
      let
        colors = config.matugen.theme.generated.base16;
      in
      {
        stylix = {
          image = config.matugen.wallpaper;
          polarity = config.matugen.mode;

          base16Scheme = lib.mkDefault {
            name = "Matugen";
            base00 = colors.base00.default;
            base01 = colors.base01.default;
            base02 = colors.base02.default;
            base03 = colors.base03.default;
            base04 = colors.base04.default;
            base05 = colors.base05.default;
            base06 = colors.base06.default;
            base07 = colors.base07.default;
            base08 = colors.base08.default;
            base09 = colors.base09.default;
            base0A = colors.base0a.default;
            base0B = colors.base0b.default;
            base0C = colors.base0c.default;
            base0D = colors.base0d.default;
            base0E = colors.base0e.default;
            base0F = colors.base0f.default;
          };
        };
      };
  };
}
