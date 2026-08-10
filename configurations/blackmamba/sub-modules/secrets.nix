{
  zen,
  ...
}:

{
  zen.hosts.blackmamba = {
    includes = [
      zen.miscellaneous.users
    ];

    nixos =
      {
        self,
        ...
      }:
      {
        sops.defaultSopsFile = "${self}/secrets/jetpure.yaml";

        sops.secrets = {
          "password/hackerx" = { };
        };
      };
  };

  zen.users.hackerx = {
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
