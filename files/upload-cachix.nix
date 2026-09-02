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
        file.".github/workflows/upload-to-cachix.yaml" = {
          yaml = {
            name = "Upload prebuilt Nix binaries to Cachix";

            on = {
              # just useful
              workflow_dispatch = { };
            };

            jobs = {
              update-flake = {
                name = "Run build-and-upload";
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
                    name = "Install Cachix";
                    uses = "cachix/cachix-action@v17";
                    "with" = {
                      name = "xache";
                      # ^^^ https://app.cachix.org/cache/xache
                      authToken = "\${{ secrets.CACHIX_AUTH_TOKEN }}";
                    };
                  }
                  {
                    name = "Build cachix-farmer";
                    run =
                      # bash
                      ''
                        nix build .#__cachix-test --no-link --print-out-paths
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
