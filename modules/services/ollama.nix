{
  ...
}:

{
  zen.services.ollama = {
    description = ''
      run AI models locally
    '';

    nixos =
      {
        pkgs,
        ...
      }:
      {
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
