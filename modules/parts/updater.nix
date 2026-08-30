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
              nix run ./#write-files
              nix run ./#write-flake
              nix fmt
            '';
          };

          meta = {
            description = "Runs every writer commands and formatter";
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
