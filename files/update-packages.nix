{
  ...
}:

{
  zen.flake-parts.default = {
    files =
      {
        ...
      }:
      {
        file.".github/workflows/update-flake.yaml" = {
          yaml = {
            name = "Update Nix flake";

            on = {
              # just useful
              workflow_dispatch = { };
            };

            permissions = {
              contents = "write";
            };

            jobs = {
              update-flake = {
                name = "Run update-flake";
                runs-on = "ubuntu-latest";

                steps = [
                  {
                    name = "Checkout";
                    uses = "actions/checkout@v6";
                  }
                  {
                    name = "Install Nix";
                    uses = "cachix/install-nix-action@v31";
                    "with" = {
                      nix_path = "nixpkgs=channel:nixos-unstable";
                      extra_nix_config = ''
                        experimental-features = nix-command flakes
                      '';
                    };
                  }
                  {
                    name = "Run flake#firefox-fetcher";
                    run =
                      # bash
                      ''
                        nix run .#firefox-fetcher -- \
                          ./packages/firefox-addons/registry.jsonc \
                          -o ./packages/firefox-addons/output.nix
                      '';
                  }
                  {
                    name = "Run flake#update-packages";
                    run =
                      # bash
                      ''
                        nix run .#update-packages
                      '';
                  }
                  {
                    name = "Run flake#fmt";
                    run =
                      # bash
                      ''
                        nix fmt
                      '';
                  }
                  {
                    name = "Commit changes";
                    run =
                      # bash
                      ''
                        git config user.name "github-actions[bot]"
                        git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
                        git add -A

                        if ! git diff --cached --quiet; then
                          git commit -m "flake: updated nix-packages [automated]"
                          git push
                        else
                          echo "No changes from updater"
                        fi
                      '';
                  }
                ];
              };
            };
          };
        };
      };
  };
}
