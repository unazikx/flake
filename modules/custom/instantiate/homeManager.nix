{
  self,
  inputs,
  zen,
  ...
}:

{
  den.schema.home.imports = [
    (
      {
        lib,
        config,
        home,
        ...
      }:
      lib.mkIf (config.class == "homeManager") {
        aspect = zen.homes.${home.name};

        instantiate =
          {
            modules,
            ...
          }:
          inputs.home-manager.lib.homeManagerConfiguration {
            inherit
              modules
              ;

            pkgs = inputs.nixpkgs.legacyPackages.${home.system};

            lib = import ./_lib.nix {
              inherit
                inputs
                lib
                ;
            };

            extraSpecialArgs = {
              inherit
                self
                inputs
                ;
            };
          };
      }
    )
  ];
}
