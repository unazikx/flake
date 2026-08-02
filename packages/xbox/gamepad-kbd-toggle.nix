{
  writeShellApplication,
  systemd,
  coreutils,
  libnotify,
  xbox,
}:

writeShellApplication {
  name = "gamepad-kbd-toggle";

  runtimeInputs = [
    systemd
    coreutils
    libnotify
    xbox.gamepad-rumble
  ];

  text = ''
    #? debounce
    stamp="$XDG_RUNTIME_DIR/gamepad-kbd.stamp"

    now="$(date +%s%3N)"
    last="$(cat "$stamp" 2>/dev/null || echo 0)"

    if [ "$((now - last))" -lt 600 ];
      then exit 0;
    fi

    echo "$now" > "$stamp"

    if systemctl --user is-active --quiet gamepad-kbd.service; then
      systemctl --user stop gamepad-kbd.service
      gamepad-rumble off || true
      notify-send --app-name=Gamepad "Gamepad" "keyboard mode OFF"
    else
      gamepad-rumble on || true
      systemctl --user start gamepad-kbd.service
      notify-send --app-name=Gamepad "Gamepad" "keyboard mode ON"
    fi
  '';
}
