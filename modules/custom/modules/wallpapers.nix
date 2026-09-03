{
  zen.custom.wallpapers = {
    root =
      {
        lib,
        ...
      }:
      {
        options = {
          wallpapers = lib.mkOption {
            type = lib.types.attrs;
            default = { };
            description = "A set of wallpapers with names and URLs.";
          };
        };
      };
  };
}
