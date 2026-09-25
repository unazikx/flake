{
  zen.custom.heroic = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.heroic;
        json = pkgs.formats.json { };
      in
      {
        imports = lib.singleton (
          lib.stylix.mkTarget
            {
              name = "heroic";
              humanName = "Heroic Launcher";
            }
            {
              config = [
                (
                  {
                    colors,
                    fonts,
                    polarity,
                  }:
                  {
                    programs.heroic = {
                      settings = {
                        customThemesPath = "${config.xdg.configHome}/heroic/themes";
                        theme = "stylix.css";
                        contentFontFamily = fonts.sansSerif.name;
                        actionsFontFamily = fonts.sansSerif.name;
                      };

                      theme = {
                        json = {
                          name = "Stylix-${polarity}";
                          filename = "stylix.css";
                          author = "nix-generated";
                        };

                        css =
                          # css
                          ''
                            body.stylix {
                              --accent: ${colors.withHashtag.base09};
                              --accent-overlay: var(--accent);

                              --action-icon-active: var(--accent);
                              --action-icon-hover: var(--text-default);
                              --action-icon: var(--navbar-accent);
                              
                              --anticheat-broken: ${colors.withHashtag.base0A};
                              --anticheat-denied: var(--danger);
                              --anticheat-planned: ${colors.withHashtag.base0E};
                              --anticheat-running: var(--text-default);
                              --anticheat-supported: ${colors.withHashtag.base0B};
                              
                              --background: ${colors.withHashtag.base00};
                              --background-darker: ${colors.withHashtag.base01};
                              --background-secondary: ${colors.withHashtag.base01};
                              --background-lighter: ${colors.withHashtag.base02};

                              --danger: ${colors.withHashtag.base0F};
                              --danger-hover: ${colors.withHashtag.base08};

                              --icon-disabled: ${colors.withHashtag.base04};
                              --icons-background: var(--background-lighter);

                              --modal-background: var(--body-background);
                              --modal-border: var(--body-background);

                              --navbar-accent: ${colors.withHashtag.base04};
                              --navbar-active-background: ${colors.withHashtag.base01};
                              --navbar-active: var(--accent);
                              --navbar-background: var(--background);

                              --neutral-06: var(--text-default);

                              --primary: ${colors.withHashtag.base08};
                              --primary-hover: ${colors.withHashtag.base09};

                              --success: ${colors.withHashtag.base0C};
                              --success-hover: ${colors.withHashtag.base0B};

                              --text-default: ${colors.withHashtag.base05};
                              --text-secondary: var(--text-default);
                              --text-tertiary: var(--background);
                              --text-title: var(--text-default);

                              --body-background: var(--background-darker);
                              --cancel-button: ${colors.withHashtag.base08};
                              --current-background: var(--body-background);
                              --input-background: var(--background);
                            }
                          '';
                      };
                    };
                  }
                )
              ];
            }
        );

        options = {
          programs.heroic = {
            enable = lib.mkEnableOption "Heroic, EGS / GOG games launcher";

            package = lib.mkPackageOption pkgs "heroic" {
              nullable = true;
            };

            proton = lib.mkPackageOption pkgs "proton-ge-bin" { };

            settings = lib.mkOption {
              type = json.type;
              default = { };
              description = "Heroic configuration options written to XDG config in JSON format.";
            };

            theme = {
              json = lib.mkOption {
                type = json.type;
                default = { };
                description = "Heroic theme parameters.";
              };

              css = lib.mkOption {
                type = lib.types.lines;
                default = null;
                description = "Heroic theme css contain.";
              };
            };

            games = lib.mkOption {
              type = lib.types.attrsOf (
                lib.types.submodule {
                  freeformType = json.type;
                }
              );
              default = { };
              description = "AppID and settings for this game.";
            };
          };
        };

        config = lib.mkIf cfg.enable {
          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = lib.mkMerge [
            {
              "heroic/config.json".source = lib.mkIf (cfg.settings != { }) (
                json.generate "heroic-settings.json" cfg.settings
              );

              "heroic/themes/stylix.css".text = lib.mkIf (cfg.theme.css != null) cfg.theme.css;
              "heroic/themes/stylix.json".source = lib.mkIf (cfg.theme.json != { }) (
                json.generate "heroic-theme.json" cfg.theme.json
              );
            }
            (lib.mkIf (cfg.games != { }) (
              lib.mapAttrs' (
                appId: gameCfg:
                lib.nameValuePair "heroic/GamesConfig/${appId}.json" {
                  source = json.generate "heroic-${appId}.json" {
                    "${appId}" = {
                      winePrefix = "${config.home.homeDirectory}/.heroic/prefixes/${appId}";
                      wineVersion = {
                        bin = "${cfg.proton.steamcompattool}/proton";
                        name = cfg.proton.steamDisplayName;
                        type = "proton";
                      };

                      advertiseAvxForRosetta = false;
                      battlEyeRuntime = true;
                      eacRuntime = true;
                      enableEsync = true;
                      enableFsync = true;
                      enableQuickSavesMenu = false;
                      enableWineWayland = true;
                      enableWoW64 = true;
                      preferSystemLibs = true;
                    }
                    // gameCfg;

                    version = "v0";
                    explicit = true;
                  };
                }
              ) cfg.games
            ))
          ];
        };
      };
  };
}
