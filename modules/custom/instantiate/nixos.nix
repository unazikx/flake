{
  self,
  inputs,
  ...
}:

{
  den.schema.host.imports = [
    (
      {
        lib,
        config,
        ...
      }:
      lib.mkIf (config.class == "nixos") {
        instantiate =
          {
            modules,
            ...
          }:
          inputs.nixpkgs.lib.nixosSystem {
            inherit
              modules
              ;

            specialArgs = {
              inherit
                self
                inputs
                ;

              lib = lib.extend (
                import ./_lib.nix {
                  inherit
                    inputs
                    ;
                }
              );
            };
          };
      }
    )
  ];
}
