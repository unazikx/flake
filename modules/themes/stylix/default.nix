# INFO:
# framework for colorize ALL system
# cool colors, i lova rainbow

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
          lib,
          config,
          ...
        }:
        {
          hm.stylix = {
            inherit (config.stylix)
              enable
              image
              base16Scheme
              polarity
              icons
              cursor
              ;

            targets = lib.mkMerge [
              {
                # keep-sorted start
                cava.rainbow.enable = true;
                gdu.enable = false;
                helix.enable = false;
                hyprland.hyprpaper.enable = true;
                hyprlock.enable = false;
                hyprlock.image.enable = false;
                kde.enable = false;
                mako.enable = false;
                mpv.enable = false;
                nixcord.enable = true;
                qt.enable = false;
                spicetify.enable = false;
                spotify-player.enable = false;
                tofi.enable = false;
                waybar.enable = false;
                # keep-sorted end
              }
              (lib.genAttrs
                [
                  "firefox"
                  "librewolf"
                  "floorp"
                ]
                (_: {
                  colorTheme.enable = true;
                  profileNames = [ lib.userName ];
                })
              )
            ];
          };

          stylix = {
            enable = true;
            overlays.enable = true;

            polarity = "dark";

            icons = {
              enable = true;

              dark = "Papirus-Dark";
              light = "Papirus-Light";

              package = pkgs.papirus-icon-theme;
            };

            cursor = {
              size = 24;
              name = "GoogleDot-Custom";
              package = inputs.nix-cursors.packages.${pkgs.system}.google-cursor.override (
                with config.lib.stylix.colors.withHashtag;
                {
                  background_color = base0E;
                  outline_color = base00;
                  accent_color = base0E;
                }
              );
            };

            fonts = lib.mkMerge [
              {
                # INFO:
                # for terminal only
                monospace = {
                  package = pkgs.nerd-fonts.caskaydia-cove;
                  name = "CaskaydiaCove Nerd Font Propo";
                };

                # INFO:
                # for other text
                sansSerif = {
                  package = pkgs.inter;
                  name = "Inter";
                };

                serif = {
                  package = pkgs.inter;
                  name = "Inter";
                };

                # WARN:
                # idk works this or not
                emoji = {
                  package = pkgs.noto-fonts-color-emoji;
                  name = "Noto Color Emoji";
                };
              }
              {
                sizes = {
                  desktop = 12;
                  popups = 12;
                  applications = 14;
                  terminal = 14;
                };
              }
            ];

            targets = {
              # keep-sorted start
              chromium.enable = true;
              console.enable = true;
              fish.enable = true;
              plymouth = {
                enable = true;
                logoAnimated = true;
              };
              # keep-sorted end
            };
          };

          fonts.packages = lib.attrValues {
            inherit (pkgs)
              # keep-sorted start
              arkpandora_ttf
              corefonts
              gelasio
              inter
              liberation_ttf
              monocraft
              noto-fonts
              noto-fonts-cjk-sans
              # keep-sorted end
              ;

            inherit (pkgs.own.fonts)
              # keep-sorted start
              gost
              segoe
              # keep-sorted end
              ;

            inherit (pkgs.wineWow64Packages)
              # keep-sorted start
              fonts
              # keep-sorted end
              ;
          };
        };
    };
}
