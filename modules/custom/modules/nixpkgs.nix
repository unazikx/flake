{
  zen.custom.nixpkgs = {
    finix =
      {
        inputs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.nixpkgs;
      in
      {
        options = {
          nixpkgs = {
            hostPlatform = lib.mkOption {
              type = lib.types.str;
            };

            config = lib.mkOption {
              type = lib.types.attrs;
              default = { };
            };

            overlays = lib.mkOption {
              type = lib.types.listOf (
                lib.mkOptionType {
                  name = "nixpkgs-overlay";
                  description = "nixpkgs overlay";
                  check = lib.isFunction;
                  merge = lib.mergeOneOption;
                }
              );
              default = [ ];
            };
          };
        };

        config = {
          nixpkgs = {
            pkgs = import inputs.nixpkgs {
              system = cfg.hostPlatform;

              inherit (cfg)
                overlays
                config
                ;
            };
          };
        };
      };
  };
}
