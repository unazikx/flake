{
  flake =
    {
      _config,
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
            inherit (_config.nixosModules)
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
              xdg
              # keep-sorted end
              ;
          };
        };
    };
}
