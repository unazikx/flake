{
  zen,
  ...
}:

{
  zen.services.display-manager = {
    description = ''
      basic sets for every display-manager
    '';

    excludes = [
      zen.services.greetd
    ];

    nixos =
      {
        ...
      }:
      {
        services.displayManager = {
          enable = true;
        };
      };
  };
}
