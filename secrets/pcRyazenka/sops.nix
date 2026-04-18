{
  lib,
  ...
}:

lib.mkSecrets.sopsnix [
  # keep-sorted start
  "password"
  "services/syncthing/cert"
  "services/syncthing/key"
  "services/syncthing/password"
  "tokens/hut"
  # keep-sorted end
] ./sops.yaml
