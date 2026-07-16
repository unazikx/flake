{
  writeShellApplication,
  systemd,
  evsieve,
  xbox,
  lib,
}:

writeShellApplication {
  name = "gamepad-kbd";

  runtimeInputs = [
    systemd
    evsieve
  ];

  text = /* shell */ ''
    GAMEPAD_PATH="/dev/input/xbox_gamepad"

    if [ ! -e "$GAMEPAD_PATH" ]; then
      echo "no gamepad found ($GAMEPAD_PATH missing)" >&2
      exit 1
    fi

    exec evsieve \
      --input "$GAMEPAD_PATH" domain=ctl grab persist=reopen \
      --hook btn:start btn:select exec-shell="systemd-run --user --quiet --collect ${lib.getExe xbox.gamepad-kbd-toggle}" \
      --hook abs:z:512~ toggle=layer:2 \
      --hook abs:z:~511 toggle=layer:1 \
      --map abs:hat0x:-1 key:left:1 \
      --map abs:hat0x:1  key:right:1 \
      --map abs:hat0x:0  key:left:0 key:right:0 \
      --map abs:hat0y:-1 key:up:1 \
      --map abs:hat0y:1  key:down:1 \
      --map abs:hat0y:0  key:up:0 key:down:0 \
      --map btn:south key:enter \
      --map btn:east  key:esc \
      --map btn:tl key:leftctrl key:tab \
      --map btn:tr key:leftctrl key:leftshift key:tab \
      --toggle @ctl @base @hold id=layer mode=consistent \
      --map key:left@hold  key:f15 \
      --map key:down@hold  key:f16 \
      --map key:up@hold    key:f17 \
      --map key:right@hold key:f18 \
      --block abs btn \
      --output name="gamepad-kbd"
  '';
}
