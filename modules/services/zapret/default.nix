# INFO:
# works zapret presets for youtube and discord

{
  flake =
    {
      ...
    }:
    {
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
