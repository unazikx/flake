{
  ...
}:

{
  zen.programs.gui.godot = {
    description = ''
      game engine
      works on GDScript and C#
    '';

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          pkgs.godot-mono
        ];
      };
  };
}
