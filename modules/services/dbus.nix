{
  ...
}:

{
  zen.services.dbus = {
    description = ''
      dbassis
    '';

    nixos =
      {
        ...
      }:
      {
        services.dbus.implementation = "broker";
      };
  };
}
