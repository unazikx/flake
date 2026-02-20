{
  pkgs,
}:

pkgs.writeShellScriptBin "hyprlock-battery-status" ''
  #!/bin/bash

  # Path to your battery (adjust if needed, e.g., BAT1)
  BATTERY_PATH="/sys/class/power_supply/BAT0"

  # Check if battery path exists
  if [ ! -d "$BATTERY_PATH" ]; then
      echo " No Battery Found" # Or another suitable 'no battery' icon like \uf05e (fa-ban)
      exit 0
  fi

  CAPACITY=$(cat "$BATTERY_PATH/capacity")
  STATUS=$(cat "$BATTERY_PATH/status")

  ICON=""
  if [ "$STATUS" = "Charging" ]; then
      # Font Awesome 'fa-bolt' icon (⚡)
      ICON=""
  elif [ "$STATUS" = "Full" ]; then
      # Font Awesome 'fa-battery-full' icon (100%)
      ICON=""
  else # Discharging or Unknown status
      if (( CAPACITY > 90 )); then ICON=" "; # fa-battery-full
      elif (( CAPACITY > 75 )); then ICON=" "; # fa-battery-three-quarters
      elif (( CAPACITY > 50 )); then ICON=" "; # fa-battery-half
      elif (( CAPACITY > 25 )); then ICON=" "; # fa-battery-quarter
      else ICON=" "; # fa-battery-empty
      fi
  fi

  # Using 'printf' to ensure no trailing newline, which can affect label positioning
  printf "%s %s%%\n" "$ICON" "$CAPACITY"
''

# meta =
#   homepage =
#     https://github.com/frigidplatypus/Snowfall-Flake/blob/main/modules/home/desktop/addons/hyprlock/default.nix
