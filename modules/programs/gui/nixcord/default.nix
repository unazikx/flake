{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    nixcord = {
      type = "github";
      owner = "kaylorben";
      repo = "nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    # keep-sorted end
  };

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

        stylix.targets = {
          nixcord.enable = false;
        };
      };
  };
}
