{
  pkgs,
  lib,
  config,
  ...
}:

let
  sway = config.hm.wayland.windowManager.sway.config;
  rules = (import ./rules.nix);
in

lib.mkMerge [
  rec {
    input."*" = {
      xkb_layout = "us,ru";
      xkb_options = "grp:caps_toggle";
    };

    bars = [ ];
    modifier = "Mod4";
    bindkeysToCode = true;
    workspaceAutoBackAndForth = false;

    gaps = {
      inner = 10;
      outer = 4;
      smartBorders = "on";
      smartGaps = true;
    };

    assigns = rules.workspaces;

    window = {
      hideEdgeBorders = "smart";
      commands = rules.window;
      titlebar = false;
      border = 3;
    };

    floating = {
      inherit modifier;
      criteria = rules.floating;
      titlebar = false;
      border = 3;
    };
  }
  {
    startup = [
      {
        command = lib.getExe pkgs.autotiling-rs;
        always = false;
      }
    ];

    colors =
      with config.lib.stylix.colors.withHashtag;
      let
        background = base00;
        color = colorBase: {
          inherit background;
          border = colorBase;
          childBorder = colorBase;
          indicator = colorBase;
          text = base05;
        };
      in
      lib.mkForce {
        background = base00;
        focused = color base01;
        focusedInactive = color base00;
        unfocused = color base00;
        urgent = color base08;
        placeholder = color base01;
      };

    keybindings = (
      import ./binds.nix {
        inherit
          sway
          pkgs
          lib
          config
          ;
      }
    );
  }
  {
    bars = [
      {
        id = toString 0;
        position = "bottom";
        mode = "dock";

        command = lib.getExe' pkgs.sway "swaybar";
        statusCommand =
          let
            inherit (config.hm.programs) i3status-rust;
            inherit (config.hm.wayland.windowManager) sway;
          in
          if i3status-rust.enable then
            "${lib.getExe pkgs.i3status-rust} ${config.hm.xdg.configHome}/i3status-rust/config-default.toml"
          else
            lib.getExe' sway.package "swaybar";

        trayOutput = "none";

        fonts = {
          size = toString config.stylix.fonts.sizes.desktop;
          names = with config.stylix.fonts; [
            monospace.name
          ];
        };

        colors =
          with config.lib.stylix.colors.withHashtag;
          lib.mkForce {
            background = base00;
            statusline = base05;

            activeWorkspace = {
              background = base01;
              border = base01;
              text = base05;
            };

            focusedWorkspace = {
              background = base02;
              border = base02;
              text = base04;
            };

            inactiveWorkspace = {
              background = base01;
              border = base01;
              text = base03;
            };

            urgentWorkspace = {
              background = base08;
              border = base01;
              text = base00;
            };
          };
      }
    ];
  }
]
