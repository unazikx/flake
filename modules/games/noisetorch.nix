{
  ...
}:

{
  zen.games.noisetorch = {
    description = ''
      noise reduction service
    '';

    nixos =
      {
        ...
      }:
      {
        programs.noisetorch = {
          enable = true;
        };
      };
  };
}
