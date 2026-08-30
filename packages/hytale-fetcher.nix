{
  writeShellApplication,
  coreutils,
  curl,
  gnused,
  nix,
  xxd,
  lib,
}:

writeShellApplication {
  name = "hytale-fetcher";

  runtimeInputs = [
    coreutils
    curl
    gnused
    nix
    xxd
  ];

  text = ''
    RELEASES_URL="https://launcher.hytale.com/version/release/launcher.json"
    NIX_FILE="packages/hytale-launcher/unwrapped.nix"
    JSON_DATA=$(curl -sA "Mozilla/5.0" "$RELEASES_URL")
    VERSION=$(echo "$JSON_DATA" | jq -r '.version')
    HASH=$(echo "$JSON_DATA" | jq -r '.download_url.linux.amd64.sha256')

    [ -z "$VERSION" ] || [ -z "$HASH" ] && echo "Error: Empty data" && exit 1

    SHA256=$(echo -n "$HASH" | xxd -r -p | base64 | tr -d '\n')

    awk -v ver="$VERSION" -v sha="sha256-$SHA256" '
        /version = ".*";/ { sub(/".*";/, "\"" ver "\";") }
        /sha256 = "sha256-.*";/ { sub(/sha256-.*";/, sha "\";") }
        { print }
    ' "$NIX_FILE" > "$NIX_FILE.tmp" && mv "$NIX_FILE.tmp" "$NIX_FILE"

    echo "Updated! New version: $VERSION with hash sha256-$SHA256"
  '';

  checkPhase = toString null;

  meta = {
    description = "Fetch Hytale version and hash";
    homepage = "https://github.com/unazikx/hytale-launcher-nix";
    license = lib.licenses.unlicense;
    mainProgram = "hytale-fetcher";
  };
}
