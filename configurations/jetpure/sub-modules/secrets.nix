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

        sops.age.keyFile =
          let
            home = config.users.users.${user.userName}.home;
          in
          "${home}/.config/sops/age/keys.txt";

        sops.secrets = {
          "programs/cachix" = {
            owner = user.userName;
            sopsFile = ../secrets.yaml;
          };

          "programs/git/user" = {
            owner = user.userName;
            sopsFile = ../secrets.yaml;
          };

          "programs/git/mail" = {
            owner = user.userName;
            sopsFile = ../secrets.yaml;
          };

          "password" = {
            owner = user.userName;
            sopsFile = ../secrets.yaml;
          };

          "programs/github" = {
            owner = user.userName;
            sopsFile = ../secrets.yaml;
          };

          "services/sunsetr" = {
            owner = user.userName;
            sopsFile = ../secrets.yaml;
          };

          "services/telegram-ws" = {
            owner = user.userName;
            sopsFile = ../secrets.yaml;
          };
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
  };
}
