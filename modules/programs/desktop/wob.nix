{
  ...
}:

{
  zen.programs.desktop.wob = {
    description = ''
      osd for various actions

      audio
      > foo | bar > /run/user/1000/wob.sock
      (or $WOBSOCK)
    '';

    homeManager =
      {
        lib,
        config,
        ...
      }:
      {
        services.wob = {
          enable = true;

          settings =
            let
              colors = config.lib.stylix.colors;
            in
            {
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

                bar_color = colors.base0B;
                background_color = colors.base00;
                border_color = colors.base00 + "00"; # transparent

                overflow_bar_color = colors.base08;
                overflow_background_color = colors.base00;
                overflow_border_color = colors.base00 + "00"; # transparent
              };

              "style.muted" = {
                bar_color = colors.base02;
              };
            };
        };

        home.sessionVariables = {
          WOBSOCK_PATH = "/run/user/1000/wob.sock";
          WOBSOCK = "$XDG_RUNTIME_DIR/wob.sock";
        };
      };
  };
}
