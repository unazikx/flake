{
  pkgs,
  lib,
  config,
  ...
}:

let
  binds = rec {
    make =
      mod: args: cmd:
      "${toString mod} ${toString args}, ${toString cmd}";

    mod = make "SUPER, ";

    shift = make "SUPER SHIFT, ";
    alt = make "SUPER ALT, ";
    ctrl = make "SUPER CTRL, ";
    fn = make ", ";
    fnShift = make "SHIFT, ";
    nullo = make null;
  };
in

{
  "$ex" = "exec";

  # binds
  bind = import ./binds.nix {
    inherit
      pkgs
      lib
      config
      binds
      ;
  };

  binde = import ./binde.nix {
    inherit
      pkgs
      lib
      config
      binds
      ;
  };

  bindm =
    let
      mouse =
        mod: args: cmd:
        "${toString mod} mouse:${toString args}, ${cmd}";

      mod = mouse "$m,   ";
      shift = mouse "$m $s,";
    in
    [
      # windows manage
      (mod "272" "movewindow")
      (shift "272" "movewindow")
      (mod "273" "resizewindow")
      (shift "273" "resizewindow 1")
    ];

  bindl = [
    ", switch:Lid Switch, exec, hyprlock"
    ", switch:on:Lid Switch, exec, hyprctl dispatch dpms off"
    ", switch:off:Lid Switch, exec, hyprctl dispatch dpms on"
  ];

  gesture = [
    "3, horizontal, workspace"
    "4, pinch, fullscreen"
  ];
}
