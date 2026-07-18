{
  ...
}:

{
  zen.users.nixzoid = {
    nixos =
      {
        config,
        user,
        ...
      }:
      {
        nix.extraOptions = ''
          !include ${config.sops.templates."nix-access-tokens".path}
        '';

        sops.defaultSopsFile = ./_secrets.yaml;

        sops.secrets = {
          # keep-sorted start block=yes newline_separated=yes
          "password/nixzoid" = {
            owner = user.userName;
          };

          "programs/cachix" = {
            owner = user.userName;
          };

          "programs/github" = {
            owner = user.userName;
          };
          # keep-sorted end
        };

        sops.templates = {
          "nix-access-tokens" = {
            owner = user.userName;
            content = ''
              access-tokens = github.com=${config.sops.placeholder."programs/github"}
            '';
          };
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
        ...
      }:
      {
        sops.defaultSopsFile = ./_secrets.yaml;

        sops.secrets = {
          # keep-sorted start block=yes newline_separated=yes
          "programs/git/mail" = { };

          "programs/git/user" = { };

          "services/sunsetr" = { };
          # keep-sorted end
        };
      };
  };
}
