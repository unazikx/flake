{
  self,
  inputs,
  zen,
  ...
}:

{
  den.schema.host.imports = [
    (
      {
        lib,
        config,
        host,
        ...
      }:
      lib.mkIf (config.class == "finix") {
        aspect = zen.hosts.${host.hostName};

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
