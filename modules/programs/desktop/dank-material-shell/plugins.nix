{
  ...
}:

{
  zen.programs.desktop.dank-material-shell.plugins = {
    homeManager =
      {
        ...
      }:
      {
        programs.dank-material-shell = {
          plugins = [
            # keep-sorted start block=yes
            {
              calculator = {
                enable = true;
                settings = {
                  trigger = "calc";
                  persistHistoryOnFile = true;
                  noTrigger = false;
                  calcEngine = "default";
                };
              };
            }
            {
              dankBitwarden = {
                # unknows date
                # no, just...no
                #
                # 07.07.26:
                # i dunno what i mean
                enable = false;
                settings = {
                  trigger = "bw";
                  noTrigger = false;
                };
              };
            }
            {
              dms-niri-screenshot = {
                settings = {
                  customPath = "~/Pictures/screenshots/scr_%d-%m-%y_%H:%M:%S.png";
                };
              };
            }
            {
              niriWindows = {
                enable = true;
                settings = {
                  enabled = true;
                  noTrigger = false;
                  trigger = "win";
                };
              };
            }
            {
              steamfriends = {
                enable = true;
                settings = {
                  apikey = null;
                  steamid = null;
                };
              };
              # keep-sorted end
            }
          ];
        };
      };
  };
}
