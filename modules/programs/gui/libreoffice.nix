{
  ...
}:

{
  zen.programs.gui.libreoffice = {
    description = ''
      good office suite
      use with zathura
    '';

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
