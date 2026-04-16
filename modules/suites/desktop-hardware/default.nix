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
              # keep-sorted start
              amd-cpu
              amd-gpu
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
              # keep-sorted end
              ;
          };
        };
    };
}
