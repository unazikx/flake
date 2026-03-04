# INFO:
# best terminal
# without tabs and multiplexer

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
          environment.variables = {
            TERM = "kitty";
            TERMINAL = "kitty";
          };

          hm.programs.kitty = {
            enable = true;
            enableGitIntegration = true;

            keybindings = import ./binds.nix {
              inherit config;
            };

            settings =
              (import ./settings.nix)
              // (import ./colors.nix {
                inherit config;
              });
          };
        };
    };
}
