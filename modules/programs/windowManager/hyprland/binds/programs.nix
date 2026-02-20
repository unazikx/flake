{
  pkgs,
  lib,
  config,
  ...
}:

let
  binds =
    mod: sub: key: cmd:
    "${toString mod}  ${toString sub}, ${key}, exec, ${cmd}";

  mod = binds "$m" null;
  shift = binds "$m" "$s";
in

(
  if config.hm.programs.kitty.enable then
    [
      (mod "return" "kitty")
      (shift "return" "kitty --class=termfloat")
    ]
  else
    [
      (mod "return" (lib.getExe pkgs.foot))
      (shift "return" ((lib.getExe pkgs.foot) + " -a termfloat"))
    ]
)
++ [
  (mod "tab" "tofi-drun | xargs hyprctl dispatch exec -- ")
  (shift "tab" (lib.getExe pkgs.clapboard))

  (shift "space" "killall -SIGUSR1 .waybar-wrapped")

  (mod "v" "AyuGram")
  (shift "v" "equibop")

  (mod "b" "qutebrowser")
  (shift "b" "keepassxc")

  (mod "n" "kitty yazi")
  (shift "n" "kitty --class=termfloat yazi")

  (mod "m" "spotify")
  (shift "m" "obsidian")
]
