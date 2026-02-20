{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        {
          environment.systemPackages = [ pkgs.onefetch ];

          programs.git = {
            enable = true;
            package = lib.mkDefault pkgs.gitMinimal;
          };

          hm.programs.git = {
            inherit (config.programs.git)
              enable
              package
              ;

            settings = {
              user.signingkey = "${config.hm.home.homeDirectory}/.ssh/id_ed25519.pub";

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
              safe.directory = lib.flakeDir;

              gpg.format = "ssh";
              commit.gpgsign = true;
              tag.gpgSign = true;
            };

            includes = [ { path = config.sopstem."git-user"; } ];
          };

          sops.templates = {
            "git-user" = {
              owner = lib.userName;
              group = "users";
              content = ''
                [user]
                  name = ${config.sopsplace."git/user"}
                  email = ${config.sopsplace."git/mail"}
              '';
            };
          };
        };
    };
}
