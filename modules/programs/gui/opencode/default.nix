# INFO:
# ai tool idk

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          config,
          ...
        }:
        {
          hm.programs.opencode = {
            enable = true;

            enableMcpIntegration = true;

            settings = {
              model = "anthropic/claude-sonnet-4-5";
            };

            web = {
              enable = true;
              environmentFile = config.sopsnix."tokens/opencode";
              extraArgs = [
                "--hostname 0.0.0.0"
                "--port 4001"
                "--mdns"
              ];
            };
          };
        };
    };
}
