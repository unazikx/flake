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
            inherit
              modules
              ;
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
