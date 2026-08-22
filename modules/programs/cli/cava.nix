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
        inputs,
        ...
      }:
      {
        imports = [
          inputs.matugen-nix-files.homeModules.cava
        ];

        programs.cava.enable = true;

        matugen.targets.cava.enable = true;

        stylix.targets = {
          cava.rainbow.enable = false;
        };
      };
  };
}
