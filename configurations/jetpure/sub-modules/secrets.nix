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
        ...
      }:
      {
        sops.defaultSopsFile = ./_secrets.yaml;

        sops.secrets = {
          "password/nixzoid" = { };
        };
      };
  };

  zen.users.nixzoid = {
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
