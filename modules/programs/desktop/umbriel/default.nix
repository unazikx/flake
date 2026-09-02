{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    umbriel = {
      type = "github";
      owner = "noctalia-dev";
      repo = "umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xdg-desktop-portal-umbriel = {
      type = "github";
      owner = "noctalia-dev";
      repo = "xdg-desktop-portal-umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.programs.desktop.umbriel = {
    description = ''
      modern window manager
      from authors Noctalia
    '';

    includes = [
      zen.programs.desktop.noctalia
      zen.programs.desktop.sunsetr
      zen.programs.desktop.umbriel.binds
      zen.programs.desktop.umbriel.rules
      zen.programs.desktop.umbriel.settings
      zen.programs.desktop.uwsm
      zen.programs.desktop.wayshot
      zen.programs.desktop.wob
      zen.programs.terminal.foot
    ];

    meta = {
      workspaceCount = 8;
    };

    wiki = {
      "Umbriel" = {
        links = [
          {
            name = "umbriel-wiki";
            url = "https://docs.noctalia.dev/umbriel";
            logo = "https://docs.noctalia.dev/_astro/noctalia-logo.BwXc-yKG.svg";
          }
        ];
      };
    };

    nixos =
      {
        self',
        inputs,
        lib,
        config,
        user,
        ...
      }:
      let
        cfg = config.programs.sway;
        uwsm = config.programs.uwsm;
      in
      {
        imports = [
          inputs.umbriel.nixosModules.default
        ];

        programs.umbriel = {
          enable = true;

          package = self'.packages.umbriel;
          portalPackage = self'.packages.xdg-desktop-portal-umbriel;
        };

        programs.uwsm = {
          waylandCompositors.umbriel = {
            prettyName = cfg.package.pname;
            comment = cfg.package.meta.description;
            binPath = "/run/current-system/sw/bin/${cfg.package.meta.mainProgram}";
          };
        };

        services = {
          displayManager = {
            defaultSession = lib.mkIf (user.defaultWm == "umbriel") "umbriel-uwsm";
          };

          gnome.gnome-keyring.enable = lib.mkForce false;

          greetd.settings = {
            initial_session = lib.mkIf (user.defaultWm == "umbriel") {
              user = user.userName;
              command =
                if uwsm.enable then
                  "${lib.getExe uwsm.package} start umbriel-uwsm.desktop"
                else
                  (lib.getExe cfg.package);
            };
          };
        };
      };

    homeManager =
      {
        inputs,
        pkgs,
        osConfig,
        ...
      }:
      let
        osCfg = osConfig.programs.umbriel;
      in
      {
        imports = [
          inputs.umbriel.homeModules.default
        ];

        programs.umbriel = {
          inherit (osCfg)
            enable
            package
            ;
        };

        xdg = {
          portal = {
            config.umbriel = {
              default = [ "umbriel" ];
              "org.freedesktop.impl.portal.FileChooser" = "gtk";
              "org.freedesktop.impl.portal.OpenURI" = "gtk";
              "org.freedesktop.impl.portal.ScreenCast" = "wlr";
              "org.freedesktop.impl.portal.Screenshot" = "wlr";
            };

            extraPortals = [
              osCfg.portalPackage
              pkgs.xdg-desktop-portal-gtk
              pkgs.xdg-desktop-portal-termfilechooser
            ];
          };

          terminal-exec = {
            settings.umbriel = [ "foot.desktop" ];
          };
        };
      };
  };

  zen.flake-parts.default = {
    packages =
      {
        inputs',
        ...
      }:
      {
        umbriel = inputs'.umbriel.packages.default;
        xdg-desktop-portal-umbriel = inputs'.xdg-desktop-portal-umbriel.packages.default;
      };
  };
}
