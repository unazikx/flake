{
  writeShellApplication,
  coreutils,
  curl,
  jq,
  gnused,
  lib,
}:

writeShellApplication {
  name = "firefox-fetcher";

  runtimeInputs = [
    coreutils
    curl
    jq
    gnused
  ];

  text = ''
    set -euo pipefail

    AMO="https://addons.mozilla.org/api/v5/addons/addon"
    UA="Mozilla/5.0 (compatible; firefox-fetcher/1.0)"

    usage() {
      echo "Usage: firefox-fetcher <addons.json> [-o <output.nix>]" >&2
      exit 1
    }

    [ "$#" -gt 0 ] || usage

    INPUT=""
    OUTPUT=""
    while [ "$#" -gt 0 ]; do
      case "$1" in
        -o|--output) OUTPUT="$2"; shift 2 ;;
        *) INPUT="$1"; shift ;;
      esac
    done

    [ -n "$INPUT" ] && [ -f "$INPUT" ] || usage

    CLEAN=$(mktemp)
    sed -E 's/^[[:space:]]*\/\/.*$//' "$INPUT" > "$CLEAN"

    nixstr() {
      local s="$1" dollar='$'
      s="''${s//\\/\\\\}"
      s="''${s//\"/\\\"}"
      s="''${s//''${dollar}{/\\''${dollar}{}"
      printf '"%s"\n' "$s"
    }

    lic() {
      case "$1" in
        MPL-2.0) printf "licenses.mpl20" ;;
        MIT) printf "licenses.mit" ;;
        ISC) printf "licenses.isc" ;;
        Apache-2.0) printf "licenses.asl20" ;;
        BSD-2-Clause) printf "licenses.bsd2" ;;
        BSD-3-Clause) printf "licenses.bsd3" ;;
        GPL-2.0*) printf "licenses.gpl2" ;;
        GPL-3.0*) printf "licenses.gpl3" ;;
        LGPL-2.0*|LGPL-2.1*) printf "licenses.lgpl21" ;;
        LGPL-3.0*) printf "licenses.lgpl3" ;;
        AGPL-3.0*) printf "licenses.agpl3" ;;
        CC0-1.0) printf "licenses.cc0" ;;
        *) printf "licenses.unfree" ;;
      esac
    }

    fetch() {
      local slug="$1" tmp
      local pname addonId version url sha256

      tmp=$(mktemp)
      if ! curl -fsSL --max-time 30 -A "$UA" "$AMO/$slug/?lang=en-US" -o "$tmp"; then
        echo "  # FAILED: could not fetch $slug" >&2
        rm -f "$tmp"
        return
      fi

      pname=$(jq -r '.slug // empty' "$tmp")
      addonId=$(jq -r '.guid // empty' "$tmp")
      version=$(jq -r '.current_version.version // empty' "$tmp")
      url=$(jq -r '.current_version.file.url // empty' "$tmp")

      if [ -z "$addonId" ] || [ -z "$version" ] || [ -z "$url" ]; then
        echo "  # FAILED: missing fields for $slug" >&2
        rm -f "$tmp"
        return
      fi

      sha256=$(curl -fsSL --max-time 60 -A "$UA" "$url" | sha256sum | cut -d' ' -f1) || {
        echo "  # FAILED: could not hash $slug" >&2
        rm -f "$tmp"
        return
      }

      echo "  $(nixstr "$pname") = buildFirefoxXpiAddon {"
      echo "    pname = $(nixstr "$pname");"
      echo "    version = $(nixstr "$version");"
      echo "    addonId = $(nixstr "$addonId");"
      echo "    url = $(nixstr "$url");"
      echo "    sha256 = \"$sha256\";"
      echo "    meta = { };"
      echo "  };"
      echo ""

      rm -f "$tmp"
    }

    if [ -n "$OUTPUT" ]; then
      exec >"$OUTPUT"
    fi

    echo "buildFirefoxXpiAddon:"
    echo ""
    echo "{"
    while read -r slug; do
      fetch "$slug"
      sleep 0.5
    done < <(jq -r '.[].slug' "$CLEAN")
    echo "}"

    rm -f "$CLEAN"
  '';

  meta = {
    description = "Fetch Firefox addons from the AMO API and generate a Nix expression";
    homepage = "https://addons.mozilla.org";
    license = lib.licenses.mit;
    mainProgram = "firefox-fetcher";
  };
}
