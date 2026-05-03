# INFO:
# simple lock manager

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
          hm.programs.swaylock = {
            enable = true;

            settings = {
              font = config.stylix.fonts.monospace.name;
              font-size = config.stylix.fonts.sizes.desktop;

              hide-keyboard-layout = true;
              disable-caps-lock-text = true;
            };
          };
        };
    };
}
