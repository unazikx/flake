{
  pkgs,
  lib,
  ...
}:

{
  normal = {
    # keep-sorted start
    ",," = "spawn --userscript ${lib.getExe pkgs.own.rbw-qutebrowser}";
    ",." = "spawn --userscript qute-keepass -p ~/Documents/passwords/db.kdbx";
    ",M" = "hint links spawn mpv {hint-url} ;; " + "message-info 'Video will be open in MPV'";
    ",l" = "spawn --userscript ${lib.getExe pkgs.own.rbw-qutebrowser} username";
    ",m" = "spawn mpv {url} ;; " + "message-info 'Video will be open in MPV'";
    ",p" = "spawn --userscript ${lib.getExe pkgs.own.rbw-qutebrowser} password";
    ",t" = "spawn --userscript ${lib.getExe pkgs.own.rbw-qutebrowser} totp";
    "<Alt-j>" = "tab-move +";
    "<Alt-k>" = "tab-move -";
    "<Alt-p>" = "open -w -- {clipboard}";
    "<Alt-t>" = "set-cmd-text -s :open -w";
    "ge" = "scroll-to-perc";
    "gh" = "open qute://start/";
    "gp" = "tab-pin ;; " + "tab-move";
    "yI" = "hint images yank -s";
    "yi" = "hint images yank";
    # keep-sorted end
  };
}
