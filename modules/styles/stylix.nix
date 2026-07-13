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
        ...
      }:
      {
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
