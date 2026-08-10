{
  zen,
  ...
}:

{
  zen.hosts.jetpure = {
    includes = [
      zen.miscellaneous.users
    ];

    nixos =
      {
        self,
        ...
      }:
      {
        users.mutableUsers = false;

        sops.defaultSopsFile = "${self}/secrets/jetpure.yaml";

        sops.secrets = {
          "password/nixzoid" = { };
          "password/root" = { };
        };
      };
  };

  zen.users.nixzoid = {
    homeManager =
      {
        self,
        config,
        ...
      }:
      {
        nix.extraOptions = ''
          !include ${config.sops.templates."nix-access-tokens".path}
        '';

        sops.defaultSopsFile = "${self}/secrets/jetpure.yaml";

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
