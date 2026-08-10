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
        host,
        ...
      }:
      {
        sops.defaultSopsFile = "${self}/secrets/${host.hostName}.yaml";

        sops.secrets = {
          "password/hackerx" = {
            neededForUsers = true;
          };

          "password/root" = {
            neededForUsers = true;
          };
        };
      };
  };

  zen.users.hackerx = {
    homeManager =
      {
        self,
        config,
        host,
        ...
      }:
      {
        nix.extraOptions = ''
          !include ${config.sops.templates."nix-access-tokens".path}
        '';

        sops.defaultSopsFile = "${self}/secrets/${host.hostName}.yaml";

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
