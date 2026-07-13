{
  ...
}:

{
  zen.programs.terminal.foot = {
    description = ''
      minimal native wayland terminal

      ex: ~~very strange font and colors~~
    '';

    homeManager =
      {
        ...
      }:
      {
        programs.foot = {
          enable = true;
          server.enable = true;

          settings = {
            main = {
              pad = "20x20 center";
              resize-by-cells = "yes";
            };

            bell.system = "no";

            cursor = {
              style = "block";
              unfocused-style = "none";
            };
          };
        };

        xdg.terminal-exec = {
          settings.default = [ "footclient.desktop" ];
        };
      };
  };
}
