{
  lib,
  config,
  ...
}:

# INFO:
# "^name$" - exact match
# "^name"  - start with name
# "name$"  - ends with name
# "name"   - name everywhere

let
  corner =
    rounding:
    lib.genAttrs [
      "top-left"
      "top-right"
      "bottom-left"
      "bottom-right"
    ] (_: rounding);

  border =
    color:
    lib.genAttrs
      [
        "active"
        "inactive"
        "urgent"
      ]
      (_: {
        inherit color;
      });

  size = height: width: {
    default-column-width.fixed = width;
    default-window-height.fixed = height;
  };

  size' = height: width: {
    default-column-width.proportion = width;
    default-window-height.proportion = height;
  };
in

[
  {
    opacity = 0.6;
    draw-border-with-background = true;
    # ^^^ if true then opacity will be replaced dim
    matches = [
      {
        is-focused = false;
      }
    ];
  }

  {
    open-maximized = false;
    open-fullscreen = false;
  }
]
++ (
  let
    openWs = ws: app-id: {
      open-on-workspace = toString ws;
      matches = [ { inherit app-id; } ];
    };
  in
  [
    # workspaces rules
    (openWs 2 "^*.qutebrowser.*$")
    (openWs 2 "librewolf")
    (openWs 3 "spotify")
    (openWs 4 "^*.ayugram.*$")
    (openWs 4 "equibop")
    (openWs 4 "mumble")
    (openWs 5 "^steam$")
    (openWs 5 "^HytaleClient$")
  ]
)
++ [
  # windows rules
  {
    default-column-width.proportion = 0.5;
    matches = [
      {
        app-id = "kitty_small";
      }
      {
        app-id = "foot_small";
      }
    ];
  }

  {
    default-column-width.proportion = 0.5;
    block-out-from = "screen-capture";
    matches = [
      { title = ".*1Password.*"; }
      { title = ".*Bitwarden.*"; }
      { title = ".*KeePassXC.*"; }
    ];
  }

  (
    {
      open-floating = true;
      open-focused = true;
      block-out-from = "screen-capture";
      matches = [
        {
          app-id = "^org.keepassxc.KeePassXC&";
          title = "^Generate Password";
        }
      ];
    }
    // (size 1041 501)
  )

  (
    {
      open-floating = true;
      open-focused = true;
      block-out-from = "screen-capture";
      matches = [
        {
          app-id = "^org.keepassxc.KeePassXC&";
          title = "^Unlock Database";
        }
      ];
    }
    // (size' 0.4 0.4)
  )

  {
    open-floating = true;
    geometry-corner-radius = corner 4.0;
    border = border config.lib.stylix.colors.withHashtag.base08;
    matches = [
      {
        app-id = "^dragon-drop$";
      }
    ];
  }

  (
    {
      open-floating = true;
      matches = [
        {
          app-id = "^firefox$";
          title = "^Picture-in-Picture";
        }
        {
          app-id = "librewolf";
          title = "^Picture-in-Picture";
        }
      ];
    }
    // (size 640 360)
  )

  {
    block-out-from = "screencast";
    matches = [
      {
        app-id = "^*ayugram*$";
      }
    ];
  }

  {
    open-fullscreen = true;
    matches = [
      {
        app-id = "^HytaleClient$";
      }
      {
        app-id = "^swayimg$";
      }
      {
        app-id = "ayugram";
        title = "Media viewer";
      }
    ];
  }

  (
    {
      matches = [
        {
          app-id = "^wofi$";
          title = "^Bluetooth$";
        }
      ];
    }
    // (size 960 470)
  )

  (
    {
      matches = [
        {
          app-id = "^org.prismlauncher.PrismLauncher$";
          title = "^New Instance";
        }
      ];
    }
    // (size' 0.7 0.7)
  )

  {
    default-column-width.proportion = 0.4;
    matches = [
      {
        app-id = "^steam$";
        title = "^Friends List$";
      }
    ];
  }

  {
    open-focused = false;
    clip-to-geometry = true;
    geometry-corner-radius = corner 4.0;
    default-floating-position = {
      x = -10;
      y = -10;
      relative-to = "bottom-right";
    };
    matches = [
      {
        app-id = "^steam$";
        title = ''^notificationtoasts_\d+_desktop$'';
      }
    ];
  }
]
