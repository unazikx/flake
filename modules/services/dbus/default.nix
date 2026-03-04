# INFO:
# dbassis

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          services = {
            dbus.implementation = "broker";

            gvfs.enable = true;

            udisks2 = {
              enable = true;

              mountOnMedia = true;
            };
          };
        };
    };
}
