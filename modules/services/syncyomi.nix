{
  zen,
  ...
}:

{
  zen.services.syncyomi = {
    description = ''
      sync server for suwayomi and mihon forks
    '';

    includes = [
      zen.custom.syncyomi
    ];

    nixos =
      {
        ...
      }:
      {
        services.syncyomi = {
          enable = false;
        };
      };
  };
}
