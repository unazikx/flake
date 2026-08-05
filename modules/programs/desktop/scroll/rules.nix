{
  ...
}:

{
  zen.programs.desktop.scroll.rules = {
    homeManagerNixos =
      {
        config,
        lib,
        ...
      }:
      let
        cfg = config.wayland.windowManager.scroll;
      in
      {
        wayland.windowManager.scroll.config = {
          assigns = lib.mkMerge [
            (lib.mapAttrs
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
                # keep-sorted end
              }
            )

            (lib.mapAttrs
              (
                _:
                map (class: {
                  inherit class;
                })
              )
              {
                # keep-sorted start block=yes newline_separated=yes
                "5" = [
                  "steam"
                ];
                # keep-sorted end
              }
            )
          ];

          window = {
            hideEdgeBorders = "smart";
            titlebar = false;
            border = 3;
            commands =
              let
                mkRules =
                  is: attrs:
                  lib.concatLists (
                    lib.mapAttrsToList (
                      rule: cmds:
                      map (command: {
                        inherit command;
                        criteria.${is} = rule;
                      }) cmds
                    ) attrs
                  );
              in
              lib.flatten [
                (mkRules "app_id" {
                  # keep-sorted start block=yes
                  "Choose Files" = [
                    "move position center"
                    "resize set 70 ppt 40 ppt"
                  ];
                  "Media viewer" = [
                    "fullscreen enable"
                    "move position center"
                  ];
                  "foot_float" = [
                    "floating enable"
                    "move position center"
                    "resize set 40 ppt 40 ppt"
                  ];
                  "kitty_float" = [
                    "floating enable"
                    "move position center"
                    "resize set 40 ppt 40 ppt"
                  ];
                  "mpv" = [
                    "dim_inactive 0.0"
                  ];
                  "org.qutebrowser.qutebrowser" = [
                    "fullscreen disable"
                  ];
                  "xdg-desktop-portal-gtk" = [
                    "move position center"
                    "resize set 70 ppt 40 ppt"
                  ];
                  # keep-sorted end
                })
                (mkRules "title" {
                  # keep-sorted start block=yes
                  "Choose Files" = [
                    "floating enable"
                  ];
                  "Friends List" = [
                    "resize set 30 ppt 100 ppt"
                  ];
                  "Media viewer" = [
                    "floating enable"
                  ];
                  "xdg-desktop-portal-gtk" = [
                    "floating enable"
                  ];
                  # keep-sorted end
                })
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
