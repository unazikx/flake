{
  zen,
  ...
}:

{
  zen.programs.desktop.hyprland = {
    description = ''
      good window manager
      idk
    '';

    includes = [
      zen.programs.desktop.noctalia
      zen.programs.desktop.sunsetr
      zen.programs.desktop.uwsm
      zen.programs.terminal.foot
    ];

    nixos =
      {
        lib,
        config,
        user,
        ...
      }:
      let
        uwsm = config.programs.uwsm;
      in
      {
        programs.hyprland = {
          enable = true;

          withUWSM = true;
          systemd.setPath.enable = true;
        };

        services = {
          displayManager = {
            defaultSession = "hyprland-uwsm";
          };

          greetd.settings = {
            initial_session = lib.mkIf (user.defaultWm == "hyprland") {
              user = user.defaultUser;
              command = "${lib.getExe uwsm.package} start hyprland-uwsm.desktop";
            };
          };

          gnome.gnome-keyring.enable = lib.mkForce false;
        };
      };

    homeManagerNixos =
      {
        pkgs,
        osConfig,
        ...
      }:
      let
        osCfg = osConfig.programs.hyprland;
      in
      {
        wayland.windowManager.hyprland = {
          inherit (osCfg)
            enable
            package
            ;

          systemd.enable = true;
        };

        xdg = {
          portal = {
            config.hyprland = {
              default = [
                "hyprland"
                "gtk"
              ];
              "org.freedesktop.impl.portal.FileChooser" = "gtk";
              "org.freedesktop.impl.portal.OpenURI" = "gtk";
              "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
              "org.freedesktop.impl.portal.Screenshot" = "hyprland";
            };

            extraPortals = [
              osCfg.portalPackage
              pkgs.xdg-desktop-portal-gtk
              pkgs.xdg-desktop-portal-termfilechooser
            ];
          };

          terminal-exec = {
            settings.hyprland = [ "foot.desktop" ];
          };
        };
      };
  };
}
