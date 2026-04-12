# WARN: not finished
# [X] basic config
# [X] secrets list (pizdec)
# [X] templates (nahuya? cul thing, fr)
#
# INFO:
# for encrypt existed file use:
# > sops -e -i secrets/users/myuser/github.yaml
#
# to edit encrypted file use:
# > sops secrets/<name>.env
#
# to rekey use:
# > sops updatekeys secrets/<name>.env
#
# for additional info see ../../../.sops.yaml

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          self,
          pkgs,
          lib,
          config,
          ...
        }:
        {
          # INFO:
          # config.sopsnix.<name> ->
          #       ^ config.sops.secrets.<name>.path
          # config.sopstem.<name> ->
          #       ^ config.sops.templates.<name>.path
          # config.sopsplace.<name> ->
          #       ^ config.sops.placeholder.<name>
          imports = [ ./module.nix ];

          environment.systemPackages = lib.attrValues {
            inherit (pkgs)
              sops
              age
              ssh-to-age
              ;
          };

          sops = {
            secrets =
              # INFO: default for every host secrets
              # for especially host create
              # > machines/machine/secerts.yaml
              (
                lib.mkSecrets.sopsnix [
                  "git/user"
                  "git/mail"

                  "tokens/anilibme"
                  "tokens/cachix"
                  "tokens/discord"
                  "tokens/github"
                  "tokens/viu"
                  "tokens/spotify-player"
                  "tokens/openrouter"

                  "services/windows"
                  "services/transmission"
                  "services/minecraft"
                  "services/minecraft-main"
                  "services/glance"
                  "services/lastfm"
                  "services/librefm"
                  "services/vaultwarden"
                  "services/syncthing/password"
                  "services/telegram-ws-proxy"

                  "accounts/googleClient/id"
                  "accounts/googleClient/secret"
                  "accounts/gmailPassword"
                  "accounts/tg"
                ] "${self}/machines/secrets.yaml"
              );

            age = {
              # for create private key use:
              # > age-keygen -y ~/.config/sops/age/keys.txt
              keyFile =
                let
                  keysText = "${config.hm.xdg.configHome}/sops/age/keys.txt";
                in
                # if (config.environment.persistence != { }) then
                #   (lib.concatStringsSep "/" [
                #     lib.persistDir
                #     keysText
                #   ])
                # else
                keysText;

              sshKeyPaths = [
                "${config.hm.home.homeDirectory}/.ssh/id_ed25519"
              ];
            };
          };
        };
    };
}
