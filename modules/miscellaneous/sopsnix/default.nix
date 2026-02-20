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
          imports = [
            ./module.nix
          ];

          environment.systemPackages = with pkgs; [
            sops
            age

            ssh-to-age
          ];

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
                  "tokens/github-nurl"
                  "tokens/viu"

                  "services/windows"
                  "services/transmission"
                  "services/minecraft"
                  "services/minecraft-main"
                  "services/glance"
                  "services/lastfm"

                  "accounts/googleClient/id"
                  "accounts/googleClient/secret"
                  "accounts/gmailPassword"
                  "accounts/tg"

                  "vpn/amneziawg/warp_1"
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
