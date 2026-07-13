{
  ...
}:

{
  zen.programs.terminal.zoxide = {
    description = ''
      i replaced z for cd
      > cd /etc/nixos/machines/pcRyazenka
      > cd pcRyaz<ENTER>
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.zoxide = {
          enable = true;
          options = [ "--cmd cd" ];
        };
      };
  };
}
