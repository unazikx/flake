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

            targets = {
              cava.rainbow.enable = true;
              hyprland.hyprpaper.enable = true;

              gdu.enable = false;
              helix.enable = false;
              kde.enable = false;
              mako.enable = false;
              mpv.enable = false;
              nixcord.enable = true;
              qt.enable = false;
              spicetify.enable = false;
              spotify-player.enable = false;
              tofi.enable = false;
              waybar.enable = false;
            }
            // (lib.genAttrs
              [
                "firefox"
                "librewolf"
                "floorp"
              ]
              (n: {
                colorTheme.enable = true;
                profileNames = [ lib.userName ];
              })
            );
          };

          stylix = {
            enable = true;
            overlays.enable = true;

            polarity = "dark";

            image = pkgs.runCommand "stylix-image.png" { } (
              lib.concatStringsSep " " [
                (lib.getExe pkgs.lutgen)
                "apply"
                inputs.wallpapers.${lib.stylix.image}
                "-o"
                "$out"
                "--"
                (builtins.concatStringsSep " " config.lib.stylix.colors.toList)
              ]
            );

            base16Scheme =
              # INFO:
              # extraOpts is { base00 = "#000000"; ... }
              # or "themeName" from base16 input
              if (lib.isString lib.stylix.theme) then
                inputs.base16."${lib.stylix.theme}"
              else if (lib.isAttrs lib.stylix.theme) then
                lib.stylix.theme
              else
                inputs.base16."oxocarbonDark";

            icons = {
              enable = true;

              dark = "Papirus-Dark";
              light = "Papirus-Light";

              package = pkgs.papirus-icon-theme;
            };

            cursor = {
              size = 24;
              name = "GoogleDot-Custom";
              package = pkgs.cursors.google-cursor.override (
                with config.lib.stylix.colors.withHashtag;
                {
                  background_color = base0E;
                  outline_color = base00;
                  accent_color = base0E;
                }
              );
            };

            fonts = {
              # INFO:
              # for terminal only
              monospace = {
                package = pkgs.nerd-fonts.caskaydia-cove;
                name = "CaskaydiaCove Nerd Font Propo";
              };

              # INFO:
              # for other text
              sansSerif = {
                package = pkgs.nerd-fonts.roboto-mono;
                name = "CaskaydiaCove Nerd Font Propo";
              };

              serif = {
                package = pkgs.nerd-fonts.roboto-mono;
                name = "RobotoMono Nerd Font Propo";
              };

              # WARN:
              # idk works this or not
              emoji = {
                package = pkgs.nerd-fonts.symbols-only;
                name = "Symbols Only Nerd Font";
              };
            }
            // {
              sizes = {
                desktop = 12;
                popups = 12;
                applications = 14;
                terminal = 14;
              };
            };

            targets = {
              console.enable = true;
              chromium.enable = true;
              fish.enable = true;

              plymouth = {
                enable = true;
                logoAnimated = true;
              };
            };
          };

          fonts.packages = lib.attrValues (
            {
              inherit (pkgs)
                arkpandora_ttf
                corefonts
                gelasio
                inter
                liberation_ttf
                noto-fonts
                noto-fonts-cjk-sans
                ;
            }
            // {
              inherit (pkgs.own.fonts) gost segoe;
              inherit (pkgs.wineWow64Packages) fonts;
            }
          );
        };
    };
}
