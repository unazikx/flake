{
  zen,
  ...
}:

{
  zen.programs.desktop.sway = {
    description = ''
      the best window manager ever
      but now i use sway, ue
    '';

    includes =
      let
        meta = zen.programs.desktop.sway.meta;
      in
      if (meta.shell == "noctalia") then
        [
          zen.programs.desktop.noctalia
          zen.programs.desktop.sunsetr
          zen.programs.desktop.sway.binds
          zen.programs.desktop.sway.binds-noctalia
          zen.programs.desktop.sway.rules
          zen.programs.desktop.sway.settings
          zen.programs.desktop.uwsm
          zen.programs.terminal.foot
        ]
      else
        [
          zen.programs.desktop.clapboard
          zen.programs.desktop.dunst
          zen.programs.desktop.i3status-rust
          zen.programs.desktop.sunsetr
          zen.programs.desktop.sway.bar
          zen.programs.desktop.sway.binds
          zen.programs.desktop.sway.binds-swsh
          zen.programs.desktop.swayidle
          zen.programs.desktop.swaylock
          zen.programs.desktop.sway.rules
          zen.programs.desktop.sway.settings
          zen.programs.desktop.tofi
          zen.programs.desktop.uwsm
          zen.programs.desktop.wayshot
          zen.programs.desktop.wob
          zen.programs.terminal.foot
        ];

    meta = {
      shell = "noctalia";
    };

    nixos =
      {
        pkgs,
        lib,
        config,
        host,
        user,
        ...
      }:
      let
        uwsm = config.programs.uwsm;
      in
      {
        programs.sway = {
          enable = true;
          package = pkgs._previous.swayfx;
        };

        programs.uwsm = {
          waylandCompositors.sway = {
            prettyName = "SwayFX";
            binPath = "/run/current-system/sw/bin/sway";
          };
        };

        # fucking idiots why blyat?
        # я вас всех в жопу ебал бляди нахуя
        services = {
          gnome.gnome-keyring.enable = lib.mkForce false;

          displayManager = {
            defaultSession = lib.mkIf (user.defaultWm == "sway") "sway";
          };

          greetd.settings = {
            initial_session = lib.mkIf (user.defaultWm == "sway") {
              user = host.defaultUser;
              command = "${lib.getExe uwsm.package} start sway-uwsm.desktop";
            };
          };
        };
      };

    homeManagerNixos =
      {
        pkgs,
        config,
        osConfig,
        ...
      }:
      {
        wayland.windowManager.sway = {
          inherit (osConfig.programs.sway)
            enable
            package
            ;

          xwayland = true;
          systemd.enable = true;

          extraSessionCommands = with config.lib.stylix.colors; ''
            export GRIMSHOT_SLURP_BACKGROUND = "${base00}CC"
            export GRIMSHOT_SLURP_COLOR      = "${base08}FF"
            export GRIMSHOT_SLURP_BORDER     = "${base02}CC"
          '';

          checkConfig = false;
        };

        xdg = {
          portal = {
            config.sway = {
              default = [
                "wlr"
                "gtk"
              ];
              "org.freedesktop.impl.portal.FileChooser" = "gtk";
              "org.freedesktop.impl.portal.OpenURI" = "gtk";
              "org.freedesktop.impl.portal.ScreenCast" = "wlr";
              "org.freedesktop.impl.portal.Screenshot" = "wlr";
            };

            # i know
            # https://github.com/sodiboo/niri-flake/blob/74053f79cad0f6c3a4a0be6b7928795d2e6a9f4b/flake.nix#L559
            extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
          };

          terminal-exec = {
            settings.sway = [ "foot.desktop" ];
          };
        };
      };
  };
}
