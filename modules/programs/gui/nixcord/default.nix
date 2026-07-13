{
  zen,
  ...
}:

{
  zen.programs.gui.nixcord = {
    description = ''
      discord modded client
      conrolled via nix

      i use vesktop cause equibop cant sharescreen
    '';

    includes = [
      zen.programs.gui.nixcord.settings
    ];

    homeManager =
      {
        inputs,
        config,
        ...
      }:
      {
        imports = [
          inputs.nixcord.homeModules.nixcord
        ];

        programs.nixcord = {
          enable = true;

          homeDirectory = config.home.homeDirectory;
          xdgConfigHome = config.xdg.configHome;

          discord.enable = false; # why?
        };
      };
  };
}
