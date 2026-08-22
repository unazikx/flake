{
  zen.custom.xmcl = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.xmcl;
        json = pkgs.formats.json { };
      in
      {
        imports = lib.singleton (
          lib.stylix.mkTarget
            {
              name = "xmcl";
              humanName = "XMCL";
            }
            {
              config = [
                (
                  {
                    colors,
                    fonts,
                    polarity,
                    ...
                  }:
                  {
                    programs.xmcl = {
                      settings = {
                        theme = polarity;
                      };

                      theme = {
                        colors = {
                          colors = {
                            darkAccentColor = colors.withHashtag.base0B;
                            darkAppBarColor = colors.withHashtag.base00;
                            darkBackground = colors.withHashtag.base00;
                            darkCardColor = colors.withHashtag.base01;
                            darkErrorColor = colors.withHashtag.base08;
                            darkInfoColor = colors.withHashtag.base09;
                            darkPrimaryColor = colors.withHashtag.base0B;
                            darkSideBarColor = colors.withHashtag.base00;
                            darkSuccessColor = colors.withHashtag.base0B;
                            darkWarningColor = colors.withHashtag.base09;
                            lightAccentColor = colors.withHashtag.base0B;
                            lightAppBarColor = colors.withHashtag.base00;
                            lightBackground = colors.withHashtag.base00;
                            lightCardColor = colors.withHashtag.base01;
                            lightErrorColor = colors.withHashtag.base08;
                            lightInfoColor = colors.withHashtag.base09;
                            lightPrimaryColor = colors.withHashtag.base0B;
                            lightSideBarColor = colors.withHashtag.base00;
                            lightSuccessColor = colors.withHashtag.base0B;
                            lightWarningColor = colors.withHashtag.base09;
                          };

                          settings = {
                            fontSize = lib.mkDefault fonts.sizes.applications;
                            dark = if (polarity == "dark") then true else false;
                          };
                        };
                      };
                    };
                  }
                )
              ];
            }
        );

        options = {
          programs.xmcl = {
            settings = lib.mkOption {
              type = json.type;
              default = { };
              description = "XMCL configuration options written to XDG config in JSON format.";
            };

            theme = {
              colors = lib.mkOption {
                type = json.type;
                default = { };
                description = "XMCL theme options.";
              };

              css = lib.mkOption {
                type = lib.types.nullOr lib.types.lines;
                default = null;
                description = "XMCL css theme options.";
              };

              background = lib.mkOption {
                type = lib.types.nullOr lib.types.path;
                default = null;
                description = "XMCL background path to symlink.";
              };
            };
          };
        };

        config = lib.mkIf cfg.enable {
          programs.xmcl = {
            theme.colors = {
              assets = lib.mkIf (cfg.theme.background != null) (
                lib.genAttrs
                  [
                    "backgroundImageDark"
                    "backgroundImageLight"
                  ]
                  (_: {
                    url = "http://launcher/theme-media/background"; # why?
                    type = "image";
                  })
              );

              settings = {
                backgroundType = lib.mkIf (cfg.theme.background != null) "image";
                backgroundImageFit = lib.mkIf (cfg.theme.background != null) "cover";
                customCssEnabled = lib.mkIf (cfg.theme.css != null) true;
              };
            };
          };

          home.packages = lib.mkIf (cfg.package != null) [ cfg.package ];

          xdg.configFile = {
            "xmcl/setting.json".source = lib.mkIf (cfg.settings != { }) (
              json.generate "xmcl-setting.json" cfg.settings
            );

            "xmcl/root".text = ''
              ${config.xdg.dataHome}/xmcl
            '';

            "xmcl/theme.json".source = lib.mkIf (cfg.theme.colors != { }) (
              json.generate "xmcl-theme.json" cfg.theme.colors
            );

            "xmcl/theme.css".text = lib.mkIf (cfg.theme.css != null) cfg.theme.css;

            "xmcl/theme-media/background".source = lib.mkIf (cfg.theme.background != null) (
              config.lib.file.mkOutOfStoreSymlink cfg.theme.background
            );
          };
        };
      };
  };
}
