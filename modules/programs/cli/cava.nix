{
  ...
}:

{
  zen.programs.cli.cava = {
    description = ''
      just audio visualizer
    '';

    homeManager = {
      programs.cava.enable = true;
    };
  };
}
