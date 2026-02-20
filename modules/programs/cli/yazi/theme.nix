{
  lib,
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;
let
  fg = base06;
in

lib.mkForce {
  indicator = {
    current = {
      fg = base00;
      bg = base0E;
      bold = true;
    };

    preview = {
      underline = false;
    };

    parent = {
      bg = base00;
    };

    padding = {
      open = "█";
      close = "█";
    };
  };

  mgr = {
    cwd = {
      fg = base0B;
    };

    tab_active = {
      fg = base01;
      bg = base0E;
    };

    tab_inactive = {
      fg = base06;
      bg = base00;
    };

    tab_width = 1;

    border_style = {
      fg = base01;
    };

    marker_marked = {
      bg = base00;
      fg = base0D;
      bold = true;
    };

    marker_selected = {
      bg = base00;
      fg = base0C;
      bold = true;
    };

    marker_copied = {
      bg = base00;
      fg = base0B;
      bold = true;
    };

    marker_cut = {
      bg = base00;
      fg = base0A;
      bold = true;
    };
  };

  which = {
    cols = 3;

    mask = {
      bg = base01;
    };
  };

  filetype = {
    rules = [
      {
        mime = "{audio,video}/*";
        inherit fg;
      }
      {
        name = "*";
        inherit fg;
      }
      {
        name = "*/";
        inherit fg;
      }
    ];
  };

  icon = (
    import ./icons/enable.nix {
      inherit
        lib
        fg
        ;
    }
  );
}
