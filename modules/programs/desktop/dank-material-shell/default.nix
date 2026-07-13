{
  zen,
  ...
}:

{
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
