{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    scroll-flake = {
      type = "github";
      owner = "diax170";
      repo = "scroll-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.programs.desktop.scroll = {
    description = ''
      based on sway
      but moves like niri, scrolls horizontal
      ill try it
    '';

    includes = [
      zen.programs.desktop.clapboard
      zen.programs.desktop.dunst
      zen.programs.desktop.i3status-rust
      zen.programs.desktop.sunsetr
      zen.programs.desktop.tofi
      zen.programs.terminal.foot
    ];

    nixos =
      {
        inputs,
        inputs',
        lib,
        config,
        user,
        ...
      }:
      {
        imports = [
          inputs.scroll-flake.nixosModules.default
        ];

        programs.scroll = {
          enable = true;
          package = inputs'.scroll-flake.packages.scroll-git;
        };

        # fucking idiots why blyat?
        # я вас всех в жопу ебал бляди нахуя
        services = {
          gnome.gnome-keyring.enable = lib.mkForce false;

          greetd.settings = {
            initial_session = lib.mkIf (user.defaultWm == "scroll") {
              user = user.userName;
              command = lib.getExe config.programs.scroll.package;
            };
          };
        };
      };

    homeManagerNixos =
      {
        pkgs,
        lib,
        config,
        osConfig,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
        fonts = config.stylix.fonts;
        cfg = config.programs.scroll;
      in
      {
        programs.scroll = {
          enable = true;

          package = osConfig.programs.scroll.package;

          settings = lib.concatStringsSep "\n" [
            ''
              set $mod   Mod4
              set $term  ${lib.getExe config.programs.foot.package "footclient"}
              set $menu  ${lib.getExe config.programs.tofi.package "tofi-drun"} | xargs ${lib.getExe cfg.package "scrollmsg"} exec --
            ''
            (lib.readFile ./config)
            ''
              client.background        ${colors.base00}
              client.focused           ${colors.base01} ${colors.base00} ${colors.base05} ${colors.base01} ${colors.base01}
              client.focused_inactive  ${colors.base00} ${colors.base00} ${colors.base05} ${colors.base00} ${colors.base00}
              client.unfocused         ${colors.base00} ${colors.base00} ${colors.base05} ${colors.base00} ${colors.base00}
              client.urgent            ${colors.base08} ${colors.base00} ${colors.base05} ${colors.base08} ${colors.base08}
              client.placeholder       ${colors.base01} ${colors.base00} ${colors.base05} ${colors.base01} ${colors.base01}

              bar {
                id        0
                font      pango:${fonts.monospace.name} ${toString fonts.sizes.desktop}
                mode      hide
                position  bottom
                
                status_command ${lib.getExe config.programs.i3status-rust.package} ${
                  lib.concatStringsSep "/" [
                    config.xdg.configHome
                    "i3status-rust"
                    "config-default.toml"
                  ]
                }

                colors {
                  background          ${colors.base00}
                  statusline          ${colors.base05}
                  focused_workspace   ${colors.base01} ${colors.base01} ${colors.base04}
                  active_workspace    ${colors.base00} ${colors.base00} ${colors.base05}
                  inactive_workspace  ${colors.base00} ${colors.base00} ${colors.base03}
                  urgent_workspace    ${colors.base00} ${colors.base08} ${colors.base00}
                }
              }
            ''
          ];
        };

        xdg.configFile."scroll/config" = {
          onChange =
            # bash
            ''
              scrollSocket="''${XDG_RUNTIME_DIR:-/run/user/$UID}/scroll-ipc.$UID.$(${lib.getExe' pkgs.procps "pgrep"} --uid $UID -x scroll || true).sock"

              if [ -S "$scrollSocket" ]; then
                ${lib.getExe' config.programs.scroll.package "scrollmsg"} -s $scrollSocket reload
              fi
            '';
        };
      };
  };
}
