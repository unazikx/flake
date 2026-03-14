# INFO:
# blue filter
# for eyes saver

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        {
          hm.programs.dank-material-shell = lib.mkMerge [
            {
              enable = true;
              systemd.enable = true;

              quickshell.package = pkgs.quickshell;

              settings = lib.mkMerge [
                (import ./settings.nix {
                  inherit lib config;
                })

                (import ./theme.nix {
                  inherit pkgs lib config;
                })
              ];

              plugins = import ./plugins.nix { };
            }
            {
              # enabled features
              enableAudioWavelength = true;
              enableCalendarEvents = true;
              enableClipboardPaste = true;

              # disabled features
              enableDynamicTheming = false;
              enableSystemMonitoring = false;
              enableVPN = false;
            }
          ];
        };
    };
}
