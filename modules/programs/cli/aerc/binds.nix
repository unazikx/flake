{
  global = {
    "<C-q>" = ":quit<Enter>";
    "<C-c>" = ":quit<Enter>";

    # tabs navigate
    "<C-p>" = ":prev-tab<Enter>";
    "<C-PgUp>" = ":prev-tab<Enter>";

    "<C-n>" = ":next-tab<Enter>";
    "<C-PgDn>" = ":next-tab<Enter>";

    # misc
    "<C-t>" = ":term<Enter>";
    "?" = ":help keys<Enter>";
  };

  messages = {
    "<Esc>" = ":clear<Enter>";
    "q" = ":quit<Enter>";

    # letters navigate
    "l" = ":view<Enter>";
    "<Enter>" = ":view<Enter>";

    "j" = ":next<Enter>";
    "<Down>" = ":next<Enter>";
    "<C-d>" = ":next 50%<Enter>";
    "<C-f>" = ":next 100%<Enter>";
    "<PgDn>" = ":next 100%<Enter>";

    "k" = ":prev<Enter>";
    "<Up>" = ":prev<Enter>";
    "<C-u>" = ":prev 50%<Enter>";
    "<C-b>" = ":prev 100%<Enter>";
    "<PgUp>" = ":prev 100%<Enter>";

    "gg" = ":select 0<Enter>";
    "G" = ":select -1<Enter>";

    # folders navigate
    "J" = ":next-folder<Enter>";
    "<C-j>" = ":next-folder<Enter>";
    "<C-Down>" = ":next-folder<Enter>";

    "K" = ":prev-folder<Enter>";
    "<C-k>" = ":prev-folder<Enter>";
    "<C-Up>" = ":prev-folder<Enter>";

    "H" = ":collapse-folder<Enter>";
    "<C-h>" = ":collapse-folder<Enter>";
    "<C-Left>" = ":collapse-folder<Enter>";

    "L" = ":expand-folder<Enter>";
    "<C-l>" = ":expand-folder<Enter>";
    "<C-Right>" = ":expand-folder<Enter>";

    # mark letters
    "z" = ":flag -t<Enter>";
    "v" = ":mark -t<Enter>";
    "V" = ":mark -at<Enter>"; # toggle marking all
    "<Space>" = ":mark -t<Enter>:next<Enter>";

    "r" = ":read<Enter>";
    "R" = ":read -t<Enter>";

    # manipulate letters
    "x" = ":move ' starred'<Enter>";
    "X" = ":move '󰯨 important'<Enter>";
    "a" = ":move ' archive'<Enter>";
    "A" = ":move ' inbox'<Enter>";
    "d" = ":move ' trash'<Enter>";
    "D" = ":delete<Enter>"; # permanently delete

    # send letters
    "c" = ":compose<Enter>";
    "C" = ":compose -s<Enter>";

    # forward
    "f" = ":forward -s<Enter>";
    "F" = ":forward -As<Enter>";

    # reply
    "er" = ":reply -a<Enter>";
    "eq" = ":reply -aq<Enter>";
    "Er" = ":reply<Enter>";
    "Eq" = ":reply -q<Enter>";

    # move to folder
    "m" = ":cf<space>";

    # cmd pipes
    "$" = ":term<space>";
    "!" = ":term<space>";
    "|" = ":pipe<space>";

    # search
    "/" = ":search<space>";
    "\\" = ":filter<space>";
    "n" = ":next-result<Enter>";
    "N" = ":prev-result<Enter>";

    # letter info
    "<Tab>" = ":envelope<Enter>";
    "<S-Tab>" = ":envelope -h<Enter>";

    # split
    "s" = ":vsplit<Enter>";
    "S" = ":split<Enter>";
  };

  view = {
    "q" = ":close<Enter>";
    "<Enter>" = ":toggle-key-passthrough<Enter>";

    # idk open
    "O" = ":open<Enter>";
    "o" = ":open<Enter>";

    # save
    "s" = ":save -p<space>";
    "S" = ":save -ap<space>";

    # manipulate letters
    "f" = ":move ' starred'<Enter>";
    "F" = ":move '󰯨 important'<Enter>";
    "a" = ":move ' archive'<Enter>";
    "A" = ":move ' inbox'<Enter>";
    "d" = ":move ' trash'<Enter>";
    "D" = ":delete<Enter>"; # permanently delete

    # reply
    # -a
    "er" = ":reply<Enter>";
    "ea" = ":reply -a<Enter>";
    "eq" = ":reply -aq<Enter>";

    # idk
    "H" = ":toggle-headers<Enter>";

    # navigate
    "J" = ":next<Enter>";
    "<C-Right>" = ":next<Enter>";
    "K" = ":prev<Enter>";
    "<C-Left>" = ":prev<Enter>";

    # letter info
    "<Tab>" = ":envelope<Enter>";
    "<S-Tab>" = ":envelope -h<Enter>";

    # translate letter
    "tr" = ":pipe trans -show-original n -b -no-autocorrect<Enter>";
  };

  "view::passthrough" = {
    "$noinherit" = "true";
    "$ex" = "<C-x>";

    "<Esc>" = ":toggle-key-passthrough<Enter>";
  };

  compose = {
    "$noinherit" = "true";
    "$ex" = "<C-x>";

    # idk wat iz it all
    "<C-c>" = ":cc";
    "<C-b>" = ":bcc";

    "<C-k>" = ":prev-field<Enter>";
    "<C-Up>" = ":prev-field<Enter>";
    "<C-j>" = ":next-field<Enter>";
    "<C-Down>" = ":next-field<Enter>";

    "<C-h>" = ":switch-account -p<Enter>";
    "<C-Left>" = ":switch-account -p<Enter>";
    "<C-l>" = ":switch-account -n<Enter>";
    "<C-Right>" = ":switch-account -n<Enter>";

    "<C-p>" = ":prev-tab<Enter>";
    "<C-PgUp>" = ":prev-tab<Enter>";
    "<C-n>" = ":next-tab<Enter>";
    "<C-PgDn>" = ":next-tab<Enter>";

    "<tab>" = ":next-field<Enter>";
    "<backtab>" = ":prev-field<Enter>";

    "<C-a>" = ":attach -m<Enter>";
    "<C-q>" = ":abort<Enter>";
  };

  "compose::editor" = {
    "$noinherit" = "true";
    "$ex" = "<exit>";

    "<C-k>" = ":prev-field<Enter>";
    "<C-Up>" = ":prev-field<Enter>";
    "<C-j>" = ":next-field<Enter>";
    "<C-Down>" = ":next-field<Enter>";

    "<C-h>" = ":switch-account -p<Enter>";
    "<C-l>" = ":switch-account -n<Enter>";

    "<C-p>" = ":prev-tab<Enter>";
    "<C-PgUp>" = ":prev-tab<Enter>";
    "<C-n>" = ":next-tab<Enter>";
    "<C-PgDn>" = ":next-tab<Enter>";

    "<C-a>" = ":attach -m<Enter>";
    "<C-q>" = ":abort<Enter>";
  };

  "compose::review" = {
    "q" = ":choose -o d discard abort -o p postpone postpone<Enter>";

    "s" = ":send<Enter>";
    "S" = ":abort<Enter>";
    "v" = ":preview<Enter>";
    "p" = ":postpone<Enter>";
    "e" = ":edit<Enter>";
    "m" = ":attach -m<space>";
    "M" = ":detach<space>";
  };

  terminal = {
    "$noinherit" = "true";
    "$ex" = "<C-x>";

    "<C-p>" = ":prev-tab<Enter>";
    "<C-n>" = ":next-tab<Enter>";
    "<C-PgUp>" = ":prev-tab<Enter>";
    "<C-PgDn>" = ":next-tab<Enter>";
  };
}
