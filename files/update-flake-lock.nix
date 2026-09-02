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
        file.".github/workflows/update-flake-lock.yaml" = {
          yaml = {
            name = "Update Nix flake lock file";

            on = {
              # just useful
              workflow_dispatch = { };
            };

            permissions = {
              contents = "write";
            };

            jobs = {
              update-flake = {
                name = "Run update-lock";
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
                    name = "Run update-lock";
                    run =
                      # bash
                      ''
                        nix flake update
                        nix flake lock
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
                          git commit -m "flake: updated nix-lock [automated]"
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
