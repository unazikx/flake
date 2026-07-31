{
  ...
}:

{
  zen.games.mangohud = {
    description = ''
      hud for fps, gpu, cpu and ram
      monitoring in games and apps
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.mangohud = {
          enable = true;

          settings = {
            vsync = 0;
            no_display = true;
            round_corners = 12;
          };
        };
      };
  };
}
