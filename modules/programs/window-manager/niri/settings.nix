{
  pkgs,
  lib,
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;

{
  screenshot-path = "~/Pictures/screenshots/scr_%d-%m-%y_%H:%M:%S.png";

  outputs = {
    "eDP-1".scale = 1.0;
  };

  input = {
    keyboard.xkb = {
      layout = "us,ru";
      options = "grp:caps_toggle, lv3:ralt_switch";
    };

    mouse = {
      scroll-method = "no-scroll";
      accel-profile = "adaptive";
    };

    trackpoint = {
      scroll-method = "on-button-down";
      accel-profile = "flat";
    };

    touchpad = {
      tap = true;
      dwt = true;
      dwtp = true;

      natural-scroll = false;

      click-method = "clickfinger";
      scroll-method = "two-finger";
      accel-profile = "adaptive";
    };

    power-key-handling.enable = false;
    focus-follows-mouse.enable = false;
    workspace-auto-back-and-forth = false;
  };

  cursor = {
    hide-when-typing = true;
    hide-after-inactive-ms = 1000;
  };

  layout = {
    background-color = base00;

    border =
      let
        mk = from: to: {
          gradient = {
            inherit from to;
            relative-to = "workspace-view";
            angle = 45;
          };
        };
      in
      lib.mkMerge [
        {
          enable = true;
          width = 5;
        }
        (
          if false then
            {
              active = mk base0B base0A;
              inactive.color = base00;
              urgent = mk base08 base09;
            }
          else
            {
              active.color = base01;
              inactive.color = base01;
              urgent.color = base08;
            }
        )
      ];

    insert-hint = {
      display.color = base01 + "CC";
    };

    gaps = 8;

    # WARN:
    # it makes side window little visible
    #
    # struts = lib.genAttrs [
    #   "left"
    #   "right"
    #   "top"
    #   "bottom"
    # ] (_: 4);

    shadow = {
      enable = true;
      softness = 30;
      draw-behind-window = true;

      color = base00 + "70";
      inactive-color = base00 + "70";
    };

    default-column-width.proportion = 0.9;

    preset-column-widths = [
      { proportion = 0.4; }
      { proportion = 0.5; }
      { proportion = 0.9; }
      { proportion = 1.0; }
    ];

    preset-window-heights = [
      { proportion = 0.4; }
      { proportion = 0.5; }
      { proportion = 1.0; }
    ];

    center-focused-column = "on-overflow";
    always-center-single-column = true;
  };

  # recent-windows = {
  #   debounce-ms = 350;
  #   open-delay-ms = 100;

  #   previews.max-scale = 0.75;

  #   highlight = {
  #     active-color = base02;
  #     urgent-color = base08;
  #     padding = 30;
  #     corner-radius = 12;
  #   };
  # };

  animations = lib.mkMerge [
    (lib.genAttrs
      [
        "horizontal-view-movement"
        "window-resize"
      ]
      (_: {
        kind.easing = {
          duration-ms = 150;
          curve = "ease-out-quad";
        };
      })
    )
    (lib.genAttrs
      [
        "window-close"
        "window-open"
        "window-movement"
        "workspace-switch"
      ]
      (_: {
        kind.easing = {
          duration-ms = 150;
          curve = "ease-out-expo";
        };
      })
    )
  ];

  window-rules = [
    {
      clip-to-geometry = true;
      geometry-corner-radius = lib.genAttrs [
        "top-left"
        "top-right"
        "bottom-left"
        "bottom-right"
      ] (_: 12.0);
    }
  ]
  ++ (import ./rules.nix {
    inherit
      lib
      config
      ;
  });

  layer-rules = [
    {
      block-out-from = "screencast";
      matches = [
        {
          namespace = "^notifications$";
        }
      ];
    }
    {
      place-within-backdrop = true;
      matches = [
        {
          namespace = "dms:blurwallpaper";
        }
      ];
    }
  ];

  workspaces = lib.genAttrs (map toString (lib.range 1 5)) (_: { });

  overview = {
    zoom = 0.95;
    backdrop-color = base00;

    workspace-shadow = {
      softness = 20;
      spread = 14;

      color = base00;
    };
  };

  binds = import ./binds.nix {
    inherit
      pkgs
      lib
      config
      ;
  };

  spawn-at-startup = [
    {
      sh = lib.getExe config.programs.steam.package;
    }
    {
      sh = lib.concatStringsSep " " [
        (lib.getExe pkgs.ayugram-desktop)
        "-startintray"
      ];
    }
  ];

  clipboard.disable-primary = true;
  gestures.hot-corners.enable = false;
  hotkey-overlay.skip-at-startup = true;
  prefer-no-csd = true;

  environment = {
    DISPLAY = ":0";
    SLURP_ARGS = "-b ${base00}CC -c ${base0F}FF -B ${base02}CC";
    # WOBSOCK = config.hm.home.sessionVariables.WOBSOCK;
  };

  debug.deactivate-unfocused-windows = true;

  xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
}
