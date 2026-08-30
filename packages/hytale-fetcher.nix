{
  writeShellApplication,
  coreutils,
  curl,
  gnused,
  nix,
  lib,
}:

writeShellApplication {
  name = "hytale-fetcher";

  runtimeInputs = [
    coreutils
    curl
    gnused
    nix
  ];

  text = ''
    RELEASES_URL="https://launcher.hytale.com/version/release/launcher.json"
    NIX_FILE="packages/hytale-launcher/unwrapped.nix"
    JSON_DATA=$(curl -sA "Mozilla/5.0" "$RELEASES_URL")
    VERSION=$(echo "$JSON_DATA" | jq -r '.version')
    SHA256=$(echo "$JSON_DATA" | jq -r '.download_url.linux.amd64.sha256')

    [ -z "$VERSION" ] || [ -z "$SHA256" ] && echo "Error: Empty data" && exit 1

    awk -v ver="$VERSION" -v sha="sha256-$SHA256" '
        /version = ".*";/ { sub(/".*";/, "\"" ver "\";") }
        /sha256 = "sha256-.*";/ { sub(/sha256-.*";/, sha "\";") }
        { print }
    ' "$NIX_FILE" > "$NIX_FILE.tmp" && mv "$NIX_FILE.tmp" "$NIX_FILE"

    echo "Updated! New version: $VERSION with hash $SHA256"
  '';

  checkPhase = toString null;

  meta = {
    description = "Fetch Firefox addons from the AMO API and generate a Nix expression";
    homepage = "https://addons.mozilla.org";
    license = lib.licenses.mit;
    mainProgram = "firefox-fetcher";
  };
}
