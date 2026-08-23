{
  ...
}:

{
  zen.programs.cli.cava = {
    description = ''
      just audio visualizer
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.cava.enable = true;

        stylix.targets = {
          cava.rainbow.enable = true;
        };
      };
  };
}
