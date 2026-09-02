{
  writeShellApplication,
  lib,
}:

writeShellApplication {
  name = "hyprlock-battery";

  text = ''
    BATTERY_PATH="/sys/class/power_supply/BAT0"

    if [ ! -d "$BATTERY_PATH" ]; then
      echo " No Battery Found"
      exit 0
    fi

    CAPACITY=$(cat "$BATTERY_PATH/capacity")
    STATUS=$(cat "$BATTERY_PATH/status")

    ICON=""

    if [ "$STATUS" = "Charging" ]; then
      ICON=""
    elif [ "$STATUS" = "Full" ]; then
      ICON=""
    else
      if (( CAPACITY > 90 )); then ICON=" ";
      elif (( CAPACITY > 75 )); then ICON=" ";
      elif (( CAPACITY > 50 )); then ICON=" ";
      elif (( CAPACITY > 25 )); then ICON=" ";
      else ICON=" ";
      fi
    fi

    printf "%s %s%%\n" "$ICON" "$CAPACITY"
  '';

  derivationArgs = {
    allowSubstitutes = false;
    preferLocalBuild = true;
  };

  meta = {
    description = "Shows battery level on hyprlock screen";
    license = lib.licenses.wtfpl;
    mainProgram = "hyprlock-battery";
  };
}
