# INFO:
# > nix fmt
# will format every .nix and .md

{
  perSystem =
    {
      ...
    }:
    {
      treefmt = {
        programs = {
          deadnix.enable = true;
          nixfmt.enable = true;
          keep-sorted.enable = true;

          prettier = {
            enable = true;
            includes = [ "*.md" ];

            settings = {
              bracketSameLine = true;
              bracketSpacing = true;
              embeddedLanguageFormatting = "auto";
              tabWidth = 2;
              useTabs = true;
            };
          };
        };
      };
    };
}
