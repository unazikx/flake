{
  zen.custom.eilmeldung = {
    homeManager =
      {
        lib,
        ...
      }:
      {
        imports = lib.singleton (
          lib.stylix.mkTarget
            {
              name = "spotatui";
              humanName = "Spotatui";
            }
            {
              config = [
                ({ colors, ... }: {
                  programs.eilmeldung.settings = {
                    theme.stylix-base16 = {
                      background = colors.base00;
                      foreground = colors.base05;
                      black = colors.base05;
                      red = colors.base08;
                      yellow = colors.base0A;
                      green = colors.base0B;
                      cyan = colors.base0C;
                      blue = colors.base0D;
                      magenta = colors.base0E;
                      white = colors.base0F;
                      dark_gray = colors.base03;
                    };
                  };
                })
              ];
            }
        );
      };
  };
}
