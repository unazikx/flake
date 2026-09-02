{
  zen,
  ...
}:

{
  zen.services.display-manager.lemurs = {
    includes = [
      zen.services.display-manager
    ];

    nixos =
      {
        ...
      }:
      {
        services.displayManager.lemurs = {
          enable = true;
        };
      };
  };
}
