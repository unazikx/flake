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
          ...
        }:
        {
          environment.shellAliases = {
            cp = lib.getExe' pkgs.fuc "cpz";
          };

          packages = with pkgs; [
            hunt
            ripgrep-all
            sd
            jq
          ];

          hm = {
            home.shellAliases = {
              cat = "bat";
            };

            programs = {
              ripgrep.enable = true;

              fd = {
                enable = true;

                ignores = [
                  ".git/"
                  "*.bak"
                ];
              };

              fzf = {
                enable = true;

                defaultOptions = [
                  "--border=rounded"
                  "--info=hidden"
                  "--no-mouse"
                  "--margin=5%"
                  "--padding=3%"
                ];
              };

              eza = {
                enable = true;

                icons = "auto";

                extraOptions = [
                  "--group-directories-first"
                  "--icons=always"
                ];
              };

              bat = {
                enable = true;

                extraPackages = lib.attrValues {
                  inherit (pkgs.bat-extras)
                    prettybat
                    batwatch
                    batgrep
                    batdiff
                    ;
                };

                config.wrap = "character";
              };
            };
          };
        };
    };
}
