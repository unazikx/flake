{
  ...
}:

{
  zen.programs.cli.yazi.theme = {
    homeManager =
      {
        config,
        ...
      }:
      {
        programs.yazi.theme =
          let
            colors = config.lib.stylix.colors.withHashtag;
            fg = colors.base06;
          in
          {
            indicator = {
              current = {
                fg = colors.base00;
                bg = colors.base0E;
                bold = true;
              };
              preview = {
                fg = colors.base05;
                bg = colors.base02;
                underline = false;
              };
              parent = {
                fg = colors.base05;
                bg = colors.base02;
              };
              padding = {
                open = "";
                close = "";
              };
            };

            mgr = {
              cwd = {
                fg = colors.base0B;
              };
              tab_active = {
                fg = colors.base01;
                bg = colors.base0E;
              };
              tab_inactive = {
                fg = colors.base06;
                bg = colors.base00;
              };
              tab_width = 1;
              border_style = {
                fg = colors.base01;
              };
              marker_marked = {
                bg = colors.base00;
                fg = colors.base0D;
                bold = true;
              };
              marker_selected = {
                bg = colors.base00;
                fg = colors.base0C;
                bold = true;
              };
              marker_copied = {
                bg = colors.base00;
                fg = colors.base0B;
                bold = true;
              };
              marker_cut = {
                bg = colors.base00;
                fg = colors.base0A;
                bold = true;
              };
            };

            which = {
              cols = 3;
              mask = {
                bg = colors.base01;
              };
            };

            filetype = {
              rules = [
                {
                  mime = "{audio,video}/*";
                  inherit fg;
                }
                {
                  mime = "image/*";
                  inherit fg;
                }
                {
                  url = "*";
                  inherit fg;
                }
                {
                  url = "*/";
                  inherit fg;
                }
                {
                  url = "*";
                  is = "orphan";
                  inherit fg;
                }
              ];
            };
          };
      };
  };
}
