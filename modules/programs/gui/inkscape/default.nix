# INFO:
# alternative for Abobe Illustrator
# vector graphic

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          ...
        }:
        {
          persist.user.directories = [
            ".config/inkscape"
          ];

          hm.home.packages = [
            (pkgs.inkscape.override {
              inkscapeExtensions = lib.attrValues {
                inherit (pkgs.inkscape-extensions)
                  textext
                  ;
              };
            })
          ];
        };
    };
}
