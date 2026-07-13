{
  ...
}:

{
  perSystem =
    {
      ...
    }:
    {
      treefmt = {
        programs = {
          deadnix.enable = true;
          keep-sorted.enable = true;
          nixfmt.enable = true;

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
