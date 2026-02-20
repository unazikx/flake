{
  pkgs,
  cacheHome ? "~/.cache",
  image ? toString null,
  base00 ? "#151515",
  base01 ? "#1f1f1f",
  themeColors ? "",
}:

pkgs.writeShellApplication {
  name = "walogram";

  runtimeInputs = with pkgs; [
    file
    imagemagick
    zip
  ];

  bashOptions = [ "pipefail" ];

  text =
    # sh
    ''
      tempdir="$(mktemp -d)"
      cachedir="${cacheHome}"
      themename="stylix.tdesktop-theme"
      walmode="solid"
      walname="background.jpg"
      blur="true"

      rm "$cachedir/$themename" -f
      mkdir -p "$cachedir"
      echo "${themeColors}" > "$tempdir/colors.tdesktop-theme"
      gentheme() {
        if command -v zip >/dev/null 2>&1; then
          if [ "$walmode" = "solid" ]; then
            magick -size 256x256 "gradient:${base01}-${base00}" "$tempdir/$walname"
          else
            case "$(file -b --mime-type "${image}")" in
            image/*) convert ''${blur:+-blur 0x32} -resize 1920x1080 "${image}" "$tempdir/$walname" ;;
            *) echo "not an image: ${image}" ;;
            esac
          fi
          zip -jq -FS "$cachedir/$themename" "$tempdir"/*
        else
          msg "'zip' not found. theme generated without background image"
          cp -f "$tempdir/colors.tdesktop-theme" "$cachedir/$themename"
        fi
      }

      gentheme
    '';
}
