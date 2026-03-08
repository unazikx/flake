{
  sway,
  lib,
  ...
}:

let
  inherit (sway) modifier;
  mkPreset = pre: data: lib.concatMapAttrs pre data;
in

{
  workspacesAndMove = mkPreset (key: ws: {
    "${modifier}+${key}" = "workspace ${ws}";
    "${modifier}+Shift+${key}" = "move container to workspace ${ws}";
  }) ((lib.genAttrs ((map toString (lib.lists.range 1 9)) ++ [ "i" ]) toString) // { "0" = "10"; });

  moveAndFocus =
    mkPreset
      (key: dir: {
        "${modifier}+${key}" = "focus ${dir}";
        "${modifier}+Shift+${key}" = "move ${dir}";
      })
      {
        h = "left";
        j = "down";
        k = "up";
        l = "right";
        left = "left";
        down = "down";
        up = "up";
        right = "right";
      };

  resizeWindow =
    let
      mkResize = h: j: k: l: {
        "${modifier}+ctrl+${h}" = "resize shrink width 10 px or 10 ppt";
        "${modifier}+ctrl+${j}" = "resize shrink height 10 px or 10 ppt";
        "${modifier}+ctrl+${k}" = "resize grow height 10 px or 10 ppt";
        "${modifier}+ctrl+${l}" = "resize grow width 10 px or 10 ppt";
      };
    in
    (mkResize "H" "J" "K" "L") // (mkResize "left" "down" "up" "right");
}
