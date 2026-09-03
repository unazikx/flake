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
      owner = "epireyn";
      repo = "niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
      # to null
      inputs.niri-stable.follows = "";
      inputs.niri-unstable.follows = "";
      inputs.xwayland-satellite-stable.follows = "";
      inputs.xwayland-satellite-unstable.follows = "";
    };
    # keep-sorted end
  };

  zen.programs.desktop.niri = {
    description = ''
      the best window manager ever
      but now i use sway, ue
    '';

    includes = [
      zen.programs.desktop.niri.binds
      zen.programs.desktop.niri.rules
      zen.programs.desktop.niri.settings
      zen.programs.desktop.noctalia
      zen.programs.desktop.sunsetr
      zen.programs.desktop.uwsm
      zen.programs.terminal.foot
    ];

    meta = {
      defaultPackage = pkgs: pkgs.niri;
    };

    nixos =
      {
        pkgs,
        lib,
        user,
        ...
      }:
      let
        meta = zen.programs.desktop.niri.meta;
      in
      {
        # fucking idiots why blyat?
        # я вас всех в жопу ебал бляди нахуя
        services = {
          displayManager = {
            defaultSession = lib.mkIf (user.defaultWm == "niri") "niri";

            sessionPackages = [
              (meta.defaultPackage pkgs)
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
        ...
      }:
      let
        meta = zen.programs.desktop.niri.meta;
      in
      {
        imports = [
          inputs.niri-flake.homeModules.niri
          inputs.niri-flake.homeModules.stylix
        ];

        programs.niri = {
          enable = true;
          package = meta.defaultPackage pkgs;
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

          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
          ];
        };
      };
  };
}
