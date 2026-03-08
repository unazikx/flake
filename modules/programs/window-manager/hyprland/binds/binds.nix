{
  pkgs,
  lib,
  config,
  binds,
  ...
}:

let
  inherit (binds)
    mod
    shift
    alt
    nullo
    ;
in

[
  (mod "space" "togglefloating")
  (alt "space" "centerwindow")

  # window control
  (mod "q" "killactive")
  (shift "q" "$ex, hyprctl kill")
  (mod "f" "fullscreen")

  (mod "x" "pseudo")
  (shift "x" "pin")

  (mod "w" "cyclenext")
  (shift "w" "swapnext")

  # (m "bracketright" "changemonitor, next")
  # (m "bracketleft" "changemonitor, prev")
  # (m "backslash" "grabroguewindows")

  # window movement
  (mod "c" "changegroupactive")
  (mod "g" "togglegroup")
  (shift "g" "moveoutofgroup")

  # special workspaces
  (mod "a" "togglespecialworkspace,  extra")
  (shift "a" "movetoworkspace, special:extra")
  (mod "d" "togglespecialworkspace,  magic")
  (shift "d" "movetoworkspace, special:magic")

  # chsnge workspaces via mouse wheel
  (binds.make "$m," "next" "workspace, e+1")
  (binds.make "$m," "prior" "workspace, e-1")

  # notifications
  (mod "mouse:275" "$ex, makoctl dismiss -a")
  (shift "mouse:275" "$ex, makoctl restore")
  (mod "grave" "$ex, wleave")
]
++ (
  let
    inherit (config.hm.xdg.userDirs.extraConfig) SCREENSHOTS;
    pic = "${SCREENSHOTS}/$(date +'scr_%d-%m-%y_%H:%M:%S.png')";
  in
  [
    # screenshot
    (nullo null "print, $ex, ${lib.getExe pkgs.grimblast} copysave area   " + pic)
    (nullo "$s" "print, $ex, ${lib.getExe pkgs.grimblast} copysave output " + pic)
    (nullo "$a" "print, $ex, ${lib.getExe pkgs.grimblast} copysave active " + pic)
  ]
)
++ (import ./programs.nix {
  inherit pkgs lib config;
})
++ (builtins.concatLists (
  builtins.genList (
    x:
    let
      key = toString x;
      # key 0 is at the end of the keyboard row
      workspaceNumber = if x == 0 then 10 else x;
    in
    [
      "$m,    ${key}, workspace,       ${toString workspaceNumber}"
      "$m $s, ${key}, movetoworkspace, ${toString workspaceNumber}"
    ]
  ) 10
))
