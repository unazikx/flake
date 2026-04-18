{
  lib,
  ...
}:

lib.mkSecrets.sopsnix [
  # keep-sorted start
  "accounts/gmailPassword"
  "accounts/googleClient/id"
  "accounts/googleClient/secret"
  "accounts/tg"
  "git/mail"
  "git/user"
  "services/glance"
  "services/lastfm"
  "services/librefm"
  "services/minecraft"
  "services/minecraft-main"
  "services/telegram-ws-proxy"
  "services/transmission"
  "services/vaultwarden"
  "services/windows"
  "tokens/anilibme"
  "tokens/cachix"
  "tokens/discord"
  "tokens/github"
  "tokens/openrouter"
  "tokens/spotify-player"
  "tokens/viu"
  # keep-sorted end
] ./secrets.yaml
