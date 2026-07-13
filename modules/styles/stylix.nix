{
  ...
}:

{
  zen.styles.stylix = {
    os =
      {
        ...
      }:
      {
        stylix = {
          enable = true;
          overlays.enable = true;
        };
      };

    nixos =
      {
        inputs,
        ...
      }:
      {
        imports = [ inputs.stylix.nixosModules.stylix ];
      };

    darwin =
      {
        inputs,
        ...
      }:
      {
        imports = [ inputs.stylix.darwin.stylix ];
      };

    homeManager =
      {
        config,
        ...
      }:
      {
        # https://github.com/nix-community/stylix/pull/2407
        home.pointerCursor = {
          enable =
            config.stylix.targets.xresources.enable
            || config.stylix.targets.gtk.enable
            || config.stylix.targets.sway.enable;

          x11.enable = config.stylix.targets.xresources.enable;
          gtk.enable = config.stylix.targets.gtk.enable;
          # sway.enable = config.stylix.targets.sway.enable;
        };

        stylix = {
          enable = true;
          overlays.enable = true;
        };
      };

    homeManagerStandalone =
      {
        inputs,
        ...
      }:
      {
        imports = [ inputs.stylix.homeModules.stylix ];
      };
  };
}
