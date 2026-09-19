{
  zen,
  ...
}:

{
  zen.programs.desktop.gnome = {
    description = ''
      macos like desktop environment
    '';

    includes = [
      zen.programs.desktop.gnome.extensions
      zen.programs.desktop.keyring
    ];

    nixos =
      {
        ...
      }:
      {
        services.desktopManager = {
          gnome.enable = true;
        };

        services.gnome = {
          gnome-software.enable = false;
          gnome-initial-setup.enable = false;
          core-apps.enable = false;
          core-developer-tools.enable = false;
          games.enable = false;
        };

        environment.gnome.excludePackages = [ ];
      };

    homeManagerNixos =
      {
        ...
      }:
      {
        programs = {
          # gnome-terminal.enable = true;
          gnome-shell.enable = true;
        };

        services = {
          polkit-gnome.enable = true;
        };
      };
  };
}
