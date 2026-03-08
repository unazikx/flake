# INFO:
# osd for various actions
#
# audio
# > foo | bar > /run/user/1000/wob.sock
# (or $WOBSOCK)

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          config,
          ...
        }:
        {
          hm = {
            services.wob = {
              enable = true;

              settings = with config.lib.stylix.colors; {
                # INFO: "" it mean to all styles
                "" = lib.mkForce rec {
                  timeout = 1400;

                  orientation = "horizontal";
                  anchor = "bottom center";

                  width = height * 10;
                  height = 48;

                  border_offset = 6;
                  border_size = 0;
                  margin = 30;

                  bar_color = base0B;
                  background_color = base00;
                  border_color = base00 + "00"; # transparent

                  overflow_bar_color = base08;
                  overflow_background_color = base00;
                  overflow_border_color = base00 + "00"; # transparent
                };

                "style.muted" = {
                  bar_color = base02;
                };
              };
            };

            home.sessionVariables = {
              WOBSOCK_PATH = "/run/user/1000/wob.sock";
              WOBSOCK = "$XDG_RUNTIME_DIR/wob.sock";
            };
          };
        };
    };
}
