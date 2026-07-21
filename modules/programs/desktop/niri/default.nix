{
  inputs,
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    niri-flake = {
      type = "github";
      owner = "cmm";
      repo = "niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
    # keep-sorted end
  };

  zen.programs.desktop.niri = {
    description = ''
      the best window manager ever
      but now i use sway, ue
    '';

    includes = [
      zen.programs.desktop.dank-material-shell
      zen.programs.desktop.niri.binds
      zen.programs.desktop.niri.rules
      zen.programs.desktop.niri.settings
      zen.programs.terminal.foot
    ];

    nixos =
      {
        pkgs,
        lib,
        user,
        ...
      }:
      {

        # fucking idiots why blyat?
        # я вас всех в жопу ебал бляди нахуя
        services = {
          displayManager = {
            defaultSession = lib.mkIf (user.defaultWm == "niri") "niri";

            sessionPackages = [
              pkgs.niri
            ];
          };

          gnome.gnome-keyring.enable = lib.mkForce false;

          greetd.settings = {
            initial_session = lib.mkIf (user.defaultWm == "niri") {
              user = user.userName;
              command = lib.getExe' pkgs.niri "niri-session";
            };
          };
        };

        nixpkgs.overlays = [
          inputs.niri-flake.overlays.niri
        ];
      };

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
      in
      {
        imports = [
          inputs.niri-flake.homeModules.niri
          inputs.niri-flake.homeModules.stylix
        ];

        programs.niri = {
          enable = true;
          package = pkgs.niri;

          extraConfig = lib.mkAfter ''
            recent-windows {
              debounce-ms 750
              open-delay-ms 150

              highlight {
                active-color "${colors.base04}ff"
                urgent-color "${colors.base08}ff"
                padding 30
                corner-radius 12
              }

              previews {
                max-height 480
                max-scale 0.5
              }

              binds {
                Alt+Tab         { next-window; }
                Alt+Shift+Tab   { previous-window; }
              }
            }
          '';
        };

        # та же хуйня:wq
        services.gnome-keyring.enable = lib.mkForce false;

        xdg.portal = {
          config.niri = {
            default = "gnome"; # fallback
            "org.freedesktop.impl.portal.ScreenCast" = "gnome";
            "org.freedesktop.impl.portal.Screenshot" = "gnome";
            "org.freedesktop.impl.portal.FileChooser" = "gnome";
            "org.freedesktop.impl.portal.OpenURI" = "gnome";
          };

          # i know
          # https://github.com/sodiboo/niri-flake/blob/74053f79cad0f6c3a4a0be6b7928795d2e6a9f4b/flake.nix#L559
          configPackages = [
            pkgs.xdg-desktop-portal-gnome
          ];
        };

        nixpkgs.overlays = [
          inputs.niri-flake.overlays.niri
        ];
      };
  };
}
