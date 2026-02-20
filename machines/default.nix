{
  self,
  ...
}:
{
  perSystem =
    {
      lib,
      ...
    }:
    {
      # INFO:
      # build any nixosConfiguration
      packages = lib.listToAttrs (
        map (name: {
          name = "${name}-toplevel";
          value = self.nixosConfigurations.${name}.config.system.build.toplevel;
        }) (lib.attrNames self.nixosConfigurations)
      );
    };
}
