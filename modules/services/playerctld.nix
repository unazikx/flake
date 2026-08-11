{
  ...
}:

{
  zen.services.playerctld = {
    description = ''
      controlls various players
      for music and media
    '';

    homeManagerNixos =
      {
        ...
      }:
      {
        services.playerctld = {
          enable = true;
        };
      };
  };
}
