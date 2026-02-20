{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          ...
        }:
        {
          persist.directories = [ "/var/lib/ollama" ];

          services = {
            ollama = {
              enable = true;
              package = pkgs.ollama-rocm;

              loadModels = [ ];
            };

            nextjs-ollama-llm-ui.enable = true;
          };
        };
    };
}
