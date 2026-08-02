{
  writeShellApplication,
  coreutils,
  evsieve,
  xbox,
  lib,
}:

writeShellApplication {
  name = "gamepad-kbd-watch";

  runtimeInputs = [
    coreutils
    evsieve
  ];

  text = ''
    GAMEPAD_PATH="/dev/input/xbox_gamepad"

    while [ ! -e "$GAMEPAD_PATH" ];
      do sleep 2;
    done

    exec evsieve \
      --input "$GAMEPAD_PATH" persist=reopen \
      --hook btn:start btn:select exec-shell="${lib.getExe xbox.gamepad-kbd-toggle}"
  '';
}
