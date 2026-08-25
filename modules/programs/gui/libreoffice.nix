{
  zen,
  ...
}:

{
  zen.programs.gui.libreoffice = {
    description = ''
      good office suite
      use with zathura
    '';

    includes = [
      zen.custom.libreoffice
    ];

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.libreoffice = {
          enable = true;

          package = pkgs.libreoffice-stable;
        };
      };
  };
}
