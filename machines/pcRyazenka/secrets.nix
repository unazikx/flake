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
  # keep-sorted end
] ./.secrets.yaml
