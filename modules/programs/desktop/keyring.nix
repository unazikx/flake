{
  ...
}:

{
  zen.programs.desktop.keyring = {
    description = ''
      settings for various keyrings
    '';

    nixos =
      {
        lib,
        ...
      }:
      {
        services.gnome = {
          gnome-keyring.enable = lib.mkForce false;
        };
      };

    homeManager =
      {
        lib,
        ...
      }:
      {
        services = {
          gnome-keyring.enable = lib.mkForce false;
        };
      };
  };
}
