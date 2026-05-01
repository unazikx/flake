{
  lib,
  ...
}:

lib.mkSecrets.sopsnix [
  # keep-sorted start
  "password"
  "services/sunsetr"
  "services/syncthing/cert"
  "services/syncthing/key"
  "services/syncthing/password"
  "tokens/hut"
  # keep-sorted end
] ./.secrets.yaml
