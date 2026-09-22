{
  zen,
  ...
}:

{
  zen.programs.desktop.niri = {
    description = ''
      the best window manager ever
      but now i use sway, ue
    '';

    includes = [
      zen.programs.desktop.keyring
      zen.programs.desktop.niri.binds
      zen.programs.desktop.niri.rules
      zen.programs.desktop.niri.settings
      zen.programs.desktop.noctalia
      zen.programs.desktop.sunsetr
      zen.programs.desktop.uwsm
      zen.programs.terminal.foot
    ];

    nixos =
      {
        ...
      }:
      {
        programs.niri = {
          enable = true;
          useNautilus = false;
        };

        programs.uwsm = {
          waylandCompositors.niri = {
            prettyName = "Niri";
            binPath = "/run/current-system/sw/bin/niri";
          };
        };
      };

    homeManagerNixos =
      {
        pkgs,
        osConfig,
        ...
      }:
      {
        wayland.windowManager.niri = {
          inherit (osConfig.programs.niri)
            enable
            package
            ;
        };

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
