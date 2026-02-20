{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          hm.programs.fastfetch = {
            enable = true;

            settings = {
              logo = {
                type = "builtin";
                source = "nixos_small";
                padding = {
                  left = 1;
                  right = 2;
                  top = 1;
                };
                color = {
                  "1" = "cyan";
                  "2" = "blue";
                };
              };
              display = {
                separator = ": ";
                color = {
                  keys = "cyan";
                  title = "blue";
                };
                size = {
                  ndigits = 1;
                  maxPrefix = "GB";
                };
              };
              modules = [
                {
                  type = "title";
                  color = {
                    user = "cyan";
                    at = "cyan";
                    host = "cyan";
                  };
                }
                {
                  type = "uptime";
                  key = "UPT ";
                  format = "{2} hours, {3} mins";
                }
                {
                  type = "packages";
                  key = "PKG ";
                }
                {
                  type = "shell";
                  key = "SHL ";
                  format = "{6} {4}";
                }
                {
                  type = "wm";
                  key = "DWM ";
                  format = "{2} / {3}";
                }
                {
                  type = "memory";
                  key = "MEM ";
                  format = "{} / {}";
                }
                { type = "break"; }
                { type = "colors"; }
              ];
            };
          };
        };
    };
}
