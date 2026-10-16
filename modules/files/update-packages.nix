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
        file.".github/workflows/update-packages.yaml" = {
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
                    uses = "actions/checkout@v7";
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
                    name = "Run flake#update-packages";
                    run =
                      # bash
                      ''
                        nix run .#fetch-all
                        nix fmt
                      '';
                  }
                  {
                    name = "Commit changes";
                    run =
                      # bash
                      ''
                        git config user.name "github-actions[bot]"
                        git config user.email "github-actions[bot]@users.noreply.github.com"
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
