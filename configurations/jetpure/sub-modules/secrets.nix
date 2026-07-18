{
  ...
}:

{
  zen.users.nixzoid = {
    nixos =
      {
        ...
      }:
      {
        sops.defaultSopsFile = ./_secrets.yaml;

        sops.secrets = {
          # keep-sorted start block=yes
          "password/nixzoid" = { };
          "services/glance" = { };
          "services/minecraft/environment" = { };
          "services/qbittorrent/flood" = { };
          "services/qbittorrent/password" = { };
          "services/qbittorrent/username" = { };
          "services/telegram-ws" = { };
          "services/vaultwarden" = { };
          "vpn/finland" = { };
          # keep-sorted end
        };
      };

    user =
      {
        config,
        ...
      }:
      {
        hashedPasswordFile = config.sops.secrets."password/nixzoid".path;
      };

    homeManager =
      {
        config,
        ...
      }:
      {
        nix.extraOptions = ''
          !include ${config.sops.templates."nix-access-tokens".path}
        '';

        sops.defaultSopsFile = ./_secrets.yaml;

        sops.secrets = {
          # keep-sorted start block=yes
          "programs/cachix" = { };
          "programs/git/mail" = { };
          "programs/git/user" = { };
          "programs/github" = { };
          "services/mpd" = { };
          "services/sunsetr" = { };
          # keep-sorted end
        };

        sops.templates = {
          "nix-access-tokens" = {
            content = ''
              access-tokens = github.com=${config.sops.placeholder."programs/github"}
            '';
          };
        };
      };
  };
}
