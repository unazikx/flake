{
  pkgs,
  lib,
  ...
}:

{
  normal = {
    # keep-sorted start
    ",," = "spawn --userscript ${lib.getExe pkgs.own.qutebrowser-extras.rbw-filler}";
    ",." = "spawn --userscript qute-keepass -p ~/Documents/passwords/db.kdbx";
    ",M" = "hint links spawn mpv {hint-url} ;; " + "message-info 'Video will be open in MPV'";
    ",R" = "hint links userscript ${lib.getExe pkgs.own.qutebrowser-extras.translator}";
    ",l" = "spawn --userscript ${lib.getExe pkgs.own.qutebrowser-extras.rbw-filler} username";
    ",m" = "spawn mpv {url} ;; " + "message-info 'Video will be open in MPV'";
    ",p" = "spawn --userscript ${lib.getExe pkgs.own.qutebrowser-extras.rbw-filler} password";
    ",r" = "spawn --userscript ${lib.getExe pkgs.own.qutebrowser-extras.translator} --target_lang ru";
    ",t" = "spawn --userscript ${lib.getExe pkgs.own.qutebrowser-extras.rbw-filler} totp";
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
