{
  ...
}:

{
  zen.programs.desktop.sway.rules = {
    homeManager =
      {
        config,
        lib,
        ...
      }:
      {
        wayland.windowManager.sway.config =
          let
            cfg = config.wayland.windowManager.sway;
          in
          {
            assigns =
              builtins.mapAttrs
                (
                  _:
                  map (app_id: {
                    inherit app_id;
                  })
                )
                {
                  # keep-sorted start block=yes newline_separated=yes
                  "2" = [
                    "firefox"
                    "chromium"
                    "org.qutebrowser.qutebrowser"
                    "zen-alpha"
                    "zen-beta"
                  ];

                  "3" = [
                    "spotify"
                  ];

                  "4" = [
                    "com.ayugram.desktop"
                    "io.github.tdesktop_x64.TDesktop"
                    "vesktop"
                  ];

                  "5" = [
                    "steam"
                  ];
                  # keep-sorted end
                };

            window = {
              hideEdgeBorders = "smart";
              titlebar = false;
              border = 3;
              commands =
                let
                  rules = is: rule: command: {
                    inherit command;
                    criteria.${is} = rule;
                  };
                in
                [
                  # keep-sorted start
                  (rules "app_id" "Choose Files" "move position center")
                  (rules "app_id" "Choose Files" "resize set 70 ppt 40 ppt")
                  (rules "app_id" "Media viewer" "fullscreen enable")
                  (rules "app_id" "Media viewer" "move position center")
                  (rules "app_id" "foot_float" "floating enable")
                  (rules "app_id" "foot_float" "move position center")
                  (rules "app_id" "foot_float" "resize set 40 ppt 40 ppt")
                  (rules "app_id" "kitty_float" "floating enable")
                  (rules "app_id" "kitty_float" "move position center")
                  (rules "app_id" "kitty_float" "resize set 40 ppt 40 ppt")
                  (rules "app_id" "mpv" "dim_inactive 0.0")
                  (rules "app_id" "xdg-desktop-portal-gtk" "move position center")
                  (rules "app_id" "xdg-desktop-portal-gtk" "resize set 70 ppt 40 ppt")
                  (rules "title" "Choose Files" "floating enable")
                  (rules "title" "Friends List" "resize set 30 ppt 100 ppt")
                  (rules "title" "Media viewer" "floating enable")
                  (rules "title" "xdg-desktop-portal-gtk" "floating enable")
                  # keep-sorted end
                ];
            };

            floating = {
              inherit (cfg.config) modifier;
              titlebar = false;
              border = 3;
              criteria = lib.flatten [
                (map (class: { inherit class; }) [
                  # keep-sorted start
                  "ani"
                  "foot_float"
                  "io.bassi.Amberol"
                  "kitty_float"
                  "org.qbittorrent.qBittorrent"
                  "xdg-desktop-portal-gtk"
                  # keep-sorted end
                ])
                (map (title: { inherit title; }) [
                  # keep-sorted start
                  "Choose Files"
                  "Media viewer"
                  # keep-sorted end
                ])
              ];
            };
          };
      };
  };
}
