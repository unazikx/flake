{
  flake =
    {
      partsConfig,
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          ...
        }:
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              amdcpu
              amdgpu
              bluetooth
              boot
              dbus
              greetd
              locales
              network
              security
              sound
              theming
              users
              ;
          };
        };
    };
}
