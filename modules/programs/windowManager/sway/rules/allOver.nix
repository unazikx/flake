{
  allOver,
  ...
}:

with allOver;
let
  float = "floating enable";
  center = "move position center";
  fullScreen = "fullscreen enable";
  undim = "dim_inactive 0.0";
  resize = a: b: "resize set ${toString a} px ${toString b} px";
  minsize = a: b: "floating_minimum_size ${toString a} x ${toString b}";
in

[
  (appid "termfloat" float)
  (appid "termfloat" center)
  (appid "termfloat" (resize 590 430))

  (appid "tfm" float)
  (appid "tfm" center)
  (appid "tfm" (resize 590 430))

  (appid "mpv" undim)
  (appid "ani" float)
  (appid "ani" (resize 590 430))

  (title "Media viewer" float)
  (appid "Media viewer" center)
  (appid "Media viewer" fullScreen)

  (title "Choose Files" float)
  (appid "Choose Files" center)
  (appid "Choose Files" (resize 880 700))

  (title "xdg-desktop-portal-gtk" float)
  (appid "xdg-desktop-portal-gtk" center)
  (appid "xdg-desktop-portal-gtk" (resize 800 570))

  (appid "com.ayugram.desktop" (minsize 700 700))
  (appid "io.github.tdesktop_x64.TDesktop" (minsize 700 700))
]
