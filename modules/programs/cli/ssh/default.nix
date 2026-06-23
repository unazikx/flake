# INFO:
# for generating ssh key use:
#
# > ssh-keygen
#
# then see check ~/.ssh/id_ed25519.pub

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          persist.user.files = [
            ".ssh/id_ed25519"
            ".ssh/id_ed25519.pub"
            ".ssh/known_hosts"
          ];

          hm = {
            programs.ssh = {
              enable = true;
              enableDefaultConfig = false;

              settings = {
                "*" = {
                  addKeysToAgent = "no";
                  compression = true;
                  controlMaster = "no";
                  controlPath = "~/.ssh/master-%r@%n:%p";
                  controlPersist = "no";
                  forwardAgent = false;
                  hashKnownHosts = true;
                  serverAliveCountMax = 3;
                  serverAliveInterval = 0;
                  userKnownHostsFile = "~/.ssh/known_hosts";
                };
              };
            };

            services.ssh-agent.enable = true;
          };
        };
    };
}
