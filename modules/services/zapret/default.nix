{
  flake =
    {
      ...
    }:
    {
      # INFO:
      # or you can use
      # https://github.com/kotudemo/zapret-presets
      # ../zapretPresets
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          services.zapret-discord-youtube = {
            enable = true;
            configName = "general(ALT)";
          };
        };
    };
}
