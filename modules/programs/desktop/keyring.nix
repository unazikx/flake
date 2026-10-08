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
        pkgs,
        ...
      }:
      {
        environment.systemPackages = [
          pkgs.seahorse
        ];

        services.gnome = {
          gnome-keyring.enable = true;
        };
      };

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          pkgs.seahorse
        ];

        services = {
          gnome-keyring.enable = true;
        };
      };
  };
}
