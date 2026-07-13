{
  ...
}:

{
  zen.programs.cli.git = {
    description = ''
      versioning directories and projects
      P1: please muself use jujutsu
      P2: ill make it soon
    '';

    nixos =
      {
        config,
        user,
        ...
      }:
      {
        sops.templates."git-user" = {
          owner = user.userName;
          content = ''
            [user]
              name = ${config.sops.placeholder."programs/git/user"}
              email = ${config.sops.placeholder."programs/git/mail"}
          '';
        };

        sops.secrets."programs/git/user" = { };
        sops.secrets."programs/git/mail" = { };
      };

    homeManager =
      {
        pkgs,
        config,
        ...
      }:
      {
        home.packages = [
          pkgs.onefetch
        ];

        programs.git = {
          enable = true;
          package = pkgs.gitMinimal;

          settings = {
            user.signingkey = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";

            color = {
              ui = true;

              diff = {
                commit = "yellow";
                frag = "cyan";
                meta = "yellow";
                new = "green";
                old = "red";
                whitespace = "red reverse";
              };
            };

            init.defaultBranch = "main";
            safe.directory = "*";

            gpg.format = "ssh";
            commit.gpgsign = true;
            tag.gpgSign = true;
          };

          signing.format = null;
        };
      };

    homeManagerNixos =
      {
        osConfig,
        ...
      }:
      {
        programs.git.includes = [
          { path = osConfig.sops.templates."git-user".path; }
        ];
      };
  };
}
