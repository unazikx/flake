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
        pkgs,
        ...
      }:
      {
        programs.git = {
          enable = true;
          package = pkgs.gitMinimal;
        };
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

          includes = [
            { path = config.sops.templates."git-user".path; }
          ];
        };

        sops.templates."git-user" = {
          content = ''
            [user]
              name = ${config.sops.placeholder."programs/git/user"}
              email = ${config.sops.placeholder."programs/git/mail"}
          '';
        };
      };
  };
}
