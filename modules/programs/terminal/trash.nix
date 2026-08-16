{
  zen,
  ...
}:

{
  zen.programs.terminal.trash = {
    description = ''
      for clear trash use
      > trash-empty

      rm replaced by trash-put
    '';

    includes = [
      zen.custom.trash
    ];

    homeManager =
      {
        ...
      }:
      {
        programs.trash = {
          enable = true;
          replaceRm = true;
        };
      };
  };
}
