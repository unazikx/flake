{
  ...
}:

{
  zen.programs.gui.inkscape = {
    description = ''
      alternative for Abobe Illustrator
      vector graphic
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          (pkgs.inkscape.override {
            inkscapeExtensions = [
              pkgs.inkscape-extensions.textext
              pkgs.inkscape-extensions.silhouette
            ];
          })
        ];
      };
  };
}
