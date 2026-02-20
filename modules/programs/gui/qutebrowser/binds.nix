{
  pkgs,
  lib,
  ...
}:

{
  normal = {
    # tabs
    "<Alt-j>" = "tab-move +";
    "<Alt-k>" = "tab-move -";
    "gp" = "tab-pin ;; " + "tab-move";

    "<Alt-t>" = "set-cmd-text -s :open -w";
    "<Alt-p>" = "open -w -- {clipboard}";

    # mpv
    "gh" = "open qute://start/";
    "ge" = "scroll-to-perc";

    # mpv
    ",m" = "spawn mpv {url} ;; " + "message-info 'Video will be open in MPV'";
    ",M" = "hint links spawn mpv {hint-url} ;; " + "message-info 'Video will be open in MPV'";

    # copy i,age url
    "yi" = "hint images yank";
    "yI" = "hint images yank -s";

    # keepassxc
    # ",." = "spawn --userscript qute-keepass -p ~/Documents/passwords/db.kdbx";
    ",." = "spawn --userscript ${lib.getExe pkgs.qutebrowser-plugins.bitwarden}";

    # bitwarden / vaultwarden
    ",," = "spawn --userscript ${lib.getExe pkgs.qutebrowser-plugins.rbw}";
    ",l" = "spawn --userscript ${lib.getExe pkgs.qutebrowser-plugins.rbw} username";
    ",p" = "spawn --userscript ${lib.getExe pkgs.qutebrowser-plugins.rbw} password";
    ",t" = "spawn --userscript ${lib.getExe pkgs.qutebrowser-plugins.rbw} totp";
  };
}
