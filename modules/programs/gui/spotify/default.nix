# INFO:
# idk how to login, i am via ~~dns.malw.link~~
# okay... sometimes via vpn lol
# okay... ... ... Russia man... blocks ye
# okay... i just bought subscription
# yeeee...meh

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          inputs,
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
                  inputs
                  pkgs
                  config
                  ;
              })
              theme
              enabledExtensions
              enabledSnippets
              ;

            alwaysEnableDevTools = true;
            windowManagerPatch = true;
            wayland = true;

            colorScheme = "custom";
            customColorScheme = with config.lib.stylix.colors; {
              # keep-sorted start

              accent = base03;
              accent-active = base03;
              accent-inactive = base02;
              banner = base03;
              border-active = base03;
              border-inactive = base03;
              button = base0B;
              button-active = base0B;
              button-disabled = base03;
              card = base00;
              equalizer = base0B;
              header = base00;
              highlight = base04;
              highlight-elevated = base03;
              main = base00;
              main-elevated = base02;
              misc = base02;
              notification = base0A;
              notification-error = base08;
              player = base00;
              selected-row = base03;
              shadow = base00;
              sidebar = base01;
              sidebar-text = base07;
              subtext = base06;
              tab-active = base04;
              text = base06;
              # keep-sorted end
            };

            spotifyLaunchFlags = "--password-store=basic";
          };
        };
    };
}
