{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          config,
          ...
        }:
        {
          persist.user.directories = [
            ".config/spotify"
            ".cache/spotify"
          ];

          hmPackages = [ pkgs.spotdl ];

          hm.programs.spicetify = {
            enable = true;

            inherit
              (import ./addons.nix {
                inherit
                  pkgs
                  config
                  ;
              })
              theme
              enabledExtensions
              enabledSnippets
              ;

            # WARN:
            # # doesnt build
            windowManagerPatch = true;
            wayland = true;

            colorScheme = "custom";
            customColorScheme = with config.lib.stylix.colors; {
              main = base00;
              main-elevated = base02;

              sidebar = base01;
              player = base00;
              card = base00;
              shadow = base00;
              selected-row = base03;

              accent = base03;
              accent-active = base03;
              accent-inactive = base02;

              border-active = base03;
              border-inactive = base03;

              header = base00;
              highlight = base04;

              text = base06;
              subtext = base06;
              sidebar-text = base07;

              button = base0B;
              button-active = base0B;
              button-disabled = base03;

              notification = base0A;
              notification-error = base08;

              tab-active = base04;
              banner = base03;
              misc = base02;
              equalizer = base0B;
              highlight-elevated = base03;
            };
          };
        };
    };
}
