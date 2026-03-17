# INFO:
# rusted replacement for much software

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
          environment = {
            systemPackages = lib.attrValues {
              inherit (pkgs) ;
              # ❯ diff --version
              # Unknown option: "--version"
              # ❯ diff -r BeyondSunset_1.0.1 BeyondSunset_1.0.1X
              # Unknown option: "-r"
              # ❯ diff BeyondSunset_1.0.1 BeyondSunset_1.0.1X -r
              # Unknown option: "-r"
            };

            shellAliases = {
              cp = lib.getExe' pkgs.fuc "cpz";
            };
          };

          packages = lib.attrValues {
            inherit (pkgs)
              hunt
              ripgrep-all
              sd
              jq
              ;
          };

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
