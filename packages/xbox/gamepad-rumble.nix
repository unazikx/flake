{
  writeShellApplication,
  python312,
  xbox,
}:

writeShellApplication {
  name = "gamepad-rumble";

  runtimeInputs = [
    (python312.withPackages (_packages: [
      _packages.evdev
    ]))
  ];

  text =
    # shell
    ''
      GAMEPAD_PATH="/dev/input/xbox_gamepad"

      [ -e "$GAMEPAD_PATH" ] || exit 0

      exec python3 ${xbox.rumble-py} "$GAMEPAD_PATH" "''${1:-on}"
    '';
}
