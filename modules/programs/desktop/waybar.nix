{
  ...
}:

{
  zen.programs.desktop.waybar = {
    description = ''
      just simple bar for you
      nothing garbage
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.waybar = {
          enable = true;
          systemd.enable = true;
        };
      };
  };
}
