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
        lib,
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
          };

          signing = {
            key = lib.mkDefault "~/.ssh/id_ed25519_sk_rk_github.pub";
            signByDefault = true;
            format = "ssh";
          };

          includes = [
            { path = config.sops.templates."git-user".path; }
          ];
        };

        sops.secrets = {
          "programs/git/mail" = { };
          "programs/git/user" = { };
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
