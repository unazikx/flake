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
      lib.mkIf (config.class == "finix") {
        instantiate =
          {
            modules,
            ...
          }:
          inputs.finix.lib.finixSystem {
            inherit
              modules
              ;

            lib = import ./_lib.nix {
              inherit
                inputs
                lib
                ;
            };

            specialArgs = {
              inherit
                self
                inputs
                ;
            };
          };

        intoAttr = [
          "nixosConfigurations"
          config.name
        ];
      }
    )
  ];
}
