{
  zen.custom.overlays = {
    root =
      {
        lib,
        ...
      }:
      {
        options = {
          overlayPkgs = lib.mkOption {
            type = lib.types.listOf lib.types.anything;
            default = [ ];
            description = "A list with overlays for flake-parts pkgs.";
          };
        };
      };
  };
}
