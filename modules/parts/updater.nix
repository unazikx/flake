{
  ...
}:

{
  zen.flake-parts.default = {
    apps =
      {
        pkgs,
        config,
        ...
      }:
      {
        default = {
          program = pkgs.writeShellApplication {
            name = "execute-flake";

            derivationArgs = {
              allowSubstitutes = false;
              preferLocalBuild = true;
            };

            text = ''
              nix run .#write-files
              nix run .#write-flake
              nix fmt
            '';
          };

          meta = {
            description = "Runs every writer commands and formatter";
          };
        };

        fetch-all = {
          program = pkgs.writeShellApplication {
            name = "execute-fetch";

            derivationArgs = {
              allowSubstitutes = false;
              preferLocalBuild = true;
            };

            text = ''
              nix run .#update-packages
              nix run .#hytale-fetcher
              nix run .#firefox-fetcher -- \
                ./packages/firefox-addons/registry.jsonc \
                -o ./packages/firefox-addons/output.nix
            '';
          };

          meta = {
            description = "Runs every fetchers";
          };
        };

        update-packages = rec {
          program = config.packages.update-packages;
          meta = program.meta;
        };

        firefox-fetcher = rec {
          program = config.packages.firefox-fetcher;
          meta = program.meta;
        };

        hytale-fetcher = rec {
          program = config.packages.hytale-fetcher;
          meta = program.meta;
        };
      };
  };
}
