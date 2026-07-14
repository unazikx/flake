{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    dms = {
      type = "github";
      owner = "avengemedia";
      repo = "dankmaterialshell";
      ref = "stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-plugins = {
      type = "github";
      owner = "avengemedia";
      repo = "dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.programs.desktop.dank-material-shell = {
    description = ''
      modern clipboard with tofi frontend
      clipboard entries are in ~/.cache/clapboard
    '';

    includes = [
      zen.programs.desktop.dank-material-shell.plugins
      zen.programs.desktop.dank-material-shell.settings
      zen.programs.desktop.dank-material-shell.theme
    ];

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.dank-material-shell = {
          enable = true;
          systemd.enable = true;

          quickshell.package = pkgs.quickshell;

          # enabled features
          enableAudioWavelength = true;
          enableCalendarEvents = true;
          enableClipboardPaste = true;

          # disabled features
          enableDynamicTheming = false;
          enableSystemMonitoring = false;
          enableVPN = false;
        };
      };
  };
}
