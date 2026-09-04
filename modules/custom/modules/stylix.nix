{
  zen.custom.stylix = {
    nixos =
      {
        lib,
        ...
      }:
      {
        options = {
          stylix = {
            images = lib.mkOption {
              type = lib.types.attrs;
              default = { };
              description = "Farmed package contains images.";
            };
          };
        };
      };

    homeManager =
      {
        lib,
        ...
      }:
      {
        options = {
          stylix = {
            images = lib.mkOption {
              type = lib.types.attrs;
              default = { };
              description = "Farmed package contains images.";
            };
          };
        };
      };
  };
}
