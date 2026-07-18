{
  ...
}:

{
  zen.programs.gui.blender = {
    description = ''
      very powerful models crafter
      and goon video montage
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          (pkgs.blender.withPackages (_packages: [ ]))
        ];
      };
  };
}
