{
  mkIcon,
  color,
  ...
}:

{
  wm = {
    "1" = "一";
    "2" = "二";
    "3" = "三";
    "4" = "四";
    "5" = "五";
    "6" = "六";
    "7" = "七";
    "8" = "八";
    "9" = "九";
    "10" = "十";
  };
  bat = [
    (mkIcon color.base08 "󰁺")
    (mkIcon color.base08 "󰁻")
    (mkIcon color.base09 "󰁼")
    (mkIcon color.base09 "󰁽")
    (mkIcon color.base08 "󰁾")
    (mkIcon color.base08 "󰁿")
    (mkIcon color.base0C "󰂀")
    (mkIcon color.base0C "󰂁")
    (mkIcon color.base0B "󰂂")
    (mkIcon color.base0B "󰁹")
  ];
  light = [
    "󱩎 "
    "󱩏 "
    "󱩐 "
    "󱩑 "
    "󱩒 "
    "󱩓 "
    "󱩔 "
    "󱩕 "
    "󱩖 "
    "󰛨 "
  ];
}
