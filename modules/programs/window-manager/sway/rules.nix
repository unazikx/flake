{
  workspaces =
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

  floating =
    (map
      (class: {
        inherit class;
      })
      [
        # keep-sorted start
        "ani"
        "io.bassi.Amberol"
        "kitty_float"
        "org.qbittorrent.qBittorrent"
        "xdg-desktop-portal-gtk"
        # keep-sorted end
      ]
    )
    ++ (map
      (title: {
        inherit title;
      })
      [
        # keep-sorted start
        "Choose Files"
        "Media viewer"
        # keep-sorted end
      ]
    );

  window =
    let
      mk = is: rule: command: {
        inherit command;
        criteria = {
          ${is} = rule;
        };
      };
      appid = mk "app_id";
      title = mk "title";
    in
    [
      # keep-sorted start
      (appid "Choose Files" "move position center")
      (appid "Choose Files" "resize set 880 px 700 px")
      (appid "Media viewer" "fullscreen enable")
      (appid "Media viewer" "move position center")
      (appid "ani" "floating enable")
      (appid "ani" "resize set 590 px 430 px")
      (appid "com.ayugram.desktop" "floating_minimum_size 700 x 700")
      (appid "io.github.tdesktop_x64.TDesktop" "floating_minimum_size 700 x 700")
      (appid "kitty_float" "floating enable")
      (appid "kitty_float" "move position center")
      (appid "kitty_float" "resize set 590 px 430 px")
      (appid "mpv" "dim_inactive 0.0")
      (appid "tfm" "floating enable")
      (appid "tfm" "move position center")
      (appid "tfm" "resize set 590 px 430 px")
      (appid "xdg-desktop-portal-gtk" "move position center")
      (appid "xdg-desktop-portal-gtk" "resize set 800 px 570 px")
      (title "Choose Files" "floating enable")
      (title "Media viewer" "floating enable")
      (title "xdg-desktop-portal-gtk" "floating enable")
      # keep-sorted end
    ];
}
