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
      };

  floating =
    (map
      (class: {
        inherit class;
      })
      [
        "kitty_float"
        "tfm"
        "xdg-desktop-portal-gtk"
        "ani"
        "io.bassi.Amberol"
        "org.qbittorrent.qBittorrent"
      ]
    )
    ++ (map
      (title: {
        inherit title;
      })
      [
        "Media viewer"
        "Choose Files"
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
      (appid "termfloat" "floating enable")
      (appid "termfloat" "move position center")
      (appid "termfloat" "resize set 590 px 430 px")
      (appid "tfm" "floating enable")
      (appid "tfm" "move position center")
      (appid "tfm" "resize set 590 px 430 px")
      (appid "mpv" "dim_inactive 0.0")
      (appid "ani" "floating enable")
      (appid "ani" "resize set 590 px 430 px")
      (title "Media viewer" "floating enable")
      (appid "Media viewer" "move position center")
      (appid "Media viewer" "fullscreen enable")
      (title "Choose Files" "floating enable")
      (appid "Choose Files" "move position center")
      (appid "Choose Files" "resize set 880 px 700 px")
      (title "xdg-desktop-portal-gtk" "floating enable")
      (appid "xdg-desktop-portal-gtk" "move position center")
      (appid "xdg-desktop-portal-gtk" "resize set 800 px 570 px")
      (appid "com.ayugram.desktop" "floating_minimum_size 700 x 700")
      (appid "io.github.tdesktop_x64.TDesktop" "floating_minimum_size 700 x 700")
    ];
}
