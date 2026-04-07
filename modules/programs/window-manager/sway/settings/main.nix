{
  pkgs,
  lib,
  config,
  ...
}:

let
  sway = config.hm.wayland.windowManager.sway.config;
  rules = (import ../rules/main.nix);
in

rec {
  terminal = "kitty";
  menu = "tofi-drun | xargs swaymsg exec --";

  input."*" = {
    xkb_layout = "us,ru";
    xkb_options = "grp:caps_toggle";
  };

  bars = [ ];
  modifier = "Mod4";
  bindkeysToCode = true;
  workspaceAutoBackAndForth = true;

  gaps = {
    inner = 4;
    outer = 10;
    smartBorders = "on";
    smartGaps = true;
  };

  assigns = rules.workspaces;

  window = {
    hideEdgeBorders = "smart";
    commands = rules.allOver;
    titlebar = false;
    border = 2;
  };

  floating = {
    inherit modifier;
    criteria = rules.float;
    titlebar = false;
    border = 2;
  };
}
// {
  startup = (
    import ./autostart.nix {
      inherit
        pkgs
        lib
        ;
    }
  );

  colors = (
    import ./colors.nix {
      inherit
        lib
        config
        ;
    }
  );

  modes = (
    import ../binds/modes.nix {
      inherit
        sway
        ;
    }
  );

  keybindings = (
    import ../binds/main.nix {
      inherit
        sway
        pkgs
        lib
        config
        ;
    }
  );
}
