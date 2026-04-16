{
  ...
}:

{
  perSystem =
    {
      ...
    }:
    {
      githubActions.workflows = {
        flakehub = {
          name = "Publish tags to FlakeHub";

          on = {
            push.tags = [ "v?[0-9]+.[0-9]+.[0-9]+*" ];
            workflowDispatch.inputs.tag = {
              description = "The existing tag to publish to FlakeHub";
              type = "string";
              required = true;
            };
          };

          jobs = {
            flakehub-publish = {
              name = "Publish flake to Flakehub";
              runsOn = "ubuntu-latest";

              permissions = {
                id-token = "write";
                contents = "read";
              };

              steps = [
                {
                  name = "Checkout repository";
                  uses = "actions/checkout@v6";

                  with_ = {
                    persist-credentials = false;
                    ref = "\${{ (inputs.tag != null) && format('refs/tags/{0}', inputs.tag) || '' }}";
                  };
                }

                {
                  name = "Install Nix (determinate)";
                  uses = "DeterminateSystems/determinate-nix-action@v3";
                }

                {
                  name = "Check flake";
                  run = "nix flake check";
                }

                {
                  name = "Format tree-wide";
                  run = "nix fmt";
                }

                {
                  name = "Run flake check";
                  uses = "DeterminateSystems/flakehub-push@main";

                  with_ = {
                    visibility = "public";
                    name = "unazikx/flake";
                    tag = "\${{ inputs.tag }}";
                    include-output-paths = true;
                  };
                }
              ];
            };
          };
        };
      };
    };
}
