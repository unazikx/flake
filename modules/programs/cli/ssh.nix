{
  ...
}:

{
  zen.programs.cli.ssh = {
    description = ''
      for generating ssh key use:

      > ssh-keygen

      then see check ~/.ssh/id_ed25519.pub
    '';

    homeManager =
      {
        lib,
        ...
      }:
      {
        programs.ssh = {
          enable = true;
          enableDefaultConfig = false;

          settings = {
            "*" = {
              addKeysToAgent = "yes";
              compression = true;
              hashKnownHosts = true;
              userKnownHostsFile = "~/.ssh/known_hosts";
            };

            "github.com" = {
              identityFile = lib.mkDefault [ "~/.ssh/id_ed25519" ];
            };
          };
        };

        services.ssh-agent = {
          enable = true;
        };
      };
  };
}
