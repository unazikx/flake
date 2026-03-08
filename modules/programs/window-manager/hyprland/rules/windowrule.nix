{
  config,
  ...
}:

let
  inherit (config.lib.stylix.colors)
    base0B
    base08
    ;

  # regex
  rule = type: rule: "${rule}, ${type}";

  # titile & class
  class = win: (rule "class:${win}");
  title = win: (rule "title:${win}");
in

[
  (class "firefox" "workspace 2 silent")
  (class "org.qutebrowser.qutebrowser" "workspace 2 silent")
  (class "zen-alpha" "workspace 2 silent")
  (class "zen-beta" "workspace 2 silent")
  (class "spotify" "workspace 3 silent")
  (class "com.ayugram.desktop" "workspace 4 silent")
  (class "io.github.tdesktop_x64.TDesktop" "workspace 4 silent")
  (class "vesktop" "workspace 5 silent")
  (class "anicli" "workspace 6 silent")
  (class "org.qbittorrent.qBittorrent" "workspace 8 silent")
  (class "steam" "workspace 10 silent")
  (title "Steam" "workspace 10 silent")

  # term rules
  (class "footfloat" "float")
  (class "termfloat" "float")
  (class "termfloat" "move center")
  (class "termfloat" "size 650 430")

  # file manager
  (class "tfm" "float")
  (class "tfm" "move center")
  (class "tfm" "size 800 350")

  (class "nemo" "float")
  (class "nemo" "move center")
  (class "nemo" "size 1100 700")

  # gram
  (title "com.ayugram.desktop" "minsize 540 680")
  (title "io.github.tdesktop_x64.TDesktop" "minsize 540 680")

  (title "Media viewer" "float")
  (title "Media viewer" "move center")
  (title "Media viewer" "size 670 540")
  (title "Media viewer" "noanim")
  (title "Media viewer" "fullscreen")

  (title "Choose Files" "float")
  (title "Choose Files" "move center")
  (title "Choose Files" "size 650 450")

  (class "xdg-desktop-portal-gtk" "float")
  (class "xdg-desktop-portal-gtk" "move center")
  (class "xdg-desktop-portal-gtk" "size 807 570")

  (class "mpv" "nodim")
  (class "ani" "float")
  (class "ani" "size 810 630")

  (class "wofi" "noanim")
  (class "wofi" "size 500 400")

  # (class "mpv" "nodim")
  (class "io.bassi.Amberol" "float")
  (class "io.bassi.Amberol" "maxsize 360 660")
  (class "io.bassi.Amberol" "minsize 360 660")

  # torrent
  (class "org.qbittorrent.qBittorrent" "float")
  (class "org.qbittorrent.qBittorrent" "size 1020 740")
  (class "org.qbittorrent.qBittorrent" "pseudo")

  # passwords
  (class "org.keepassxc.KeePassXC" "float")
  (class "org.keepassxc.KeePassXC" "minsize 850 900")
  (class "org.keepassxc.KeePassXC" "maxsize 850 900")

  # prism launcher news
  (title "News — Prism Launcher *" "float")
  (title "News — Prism Launcher *" "minsize 710 920")
  (title "News — Prism Launcher *" "maxsize 710 920")

  # pinned
  (rule "pinned:1" "bordercolor rgb(${base0B})")

  (class "dragon-drop" "pin")
  (class "dragon-drop" "nodim")
  (class "dragon-drop" "noanim")
  (class "dragon-drop" "bordercolor rgb(${base08})")
]
++ (
  let
    no = "norounding, noborder, floating:0,";
  in
  [
    (no + "onworkspace:w[tv1]")
    (no + "onworkspace:f[1]")
  ]
)
