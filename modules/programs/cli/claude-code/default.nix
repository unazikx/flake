# INFO:
# just visualizer

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
          environment.interactiveShellInit =
            # bash
            ''
              export OPENROUTER_API_KEY="$(cat ${config.sopsnix."tokens/openrouter"})"

              export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
              export ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"
              export ANTHROPIC_API_KEY=""

              export ANTHROPIC_MODEL="qwen/qwen3.6-plus:free"
            '';

          hm.programs.claude-code = {
            enable = true;
          };
        };
    };
}
