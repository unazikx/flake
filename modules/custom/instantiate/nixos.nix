{
  self,
  inputs,
  ...
}:

{
  den.schema.host =
    {
      lib,
      host,
      ...
    }:
    {
      config.instantiate = lib.mkMerge [
        (lib.mkIf (host.class == "nixos") (
          { modules }:
          inputs.nixpkgs.lib.nixosSystem {
            modules = lib.flatten [
              modules
              (
                {
                  options,
                  ...
                }:
                {
                  config = lib.mkIf (options ? home-manager) {
                    home-manager.extraSpecialArgs = {
                      inherit
                        self
                        inputs
                        ;
                    };
                  };
                }
              )
            ];

            specialArgs = {
              inherit
                self
                inputs
                ;

              lib = lib.extend (import ./_lib.nix inputs);
            };
          }
        ))
      ];
    };
}
