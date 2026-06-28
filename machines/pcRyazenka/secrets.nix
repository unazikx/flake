{
  lib,
  ...
}:

lib.mkSecrets.fromFile [
  # keep-sorted start
  "password"
  "services/sunsetr"
  "services/syncthing/cert"
  "services/syncthing/key"
  "services/syncthing/password"
  "tokens/hut"
  "tokens/itchio"
  "tokens/opencode"
  # keep-sorted end
] ./.secrets.yaml
