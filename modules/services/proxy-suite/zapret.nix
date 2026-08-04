{
  ...
}:

{
  zen.services.proxy-suite.zapret = {
    nixos =
      {
        config,
        ...
      }:
      {
        services.proxy-suite = {
          zapret = {
            enable = true;

            configName = "general (ALT12)";
            gameFilter = if config.programs.steam.enable then "all" else "null";
          };
        };
      };
  };
}
