{
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;

''
  *.default=true
  *.selected.reverse=true
  *.bg="${base00}"

  *error.bold=true
  error.fg="${base08}"
  warning.fg="${base09}"
  success.fg="${base0B}"

  statusline_default.reverse=false
  statusline*.bg="${base01}"
  statusline_default.fg="${base04}"
  statusline_error.fg="${base08}"
  statusline_error.reverse=true

  msglist_unread.bold=true
  msglist_unread.fg="${base06}"
  msglist_deleted.fg="${base03}"
  msglist_marked.bg="${base02}"
  msglist_flagged.fg="${base0A}"

  dirlist_unread.fg="${base08}"
  dirlist*.fg="${base04}"
  dirlist*.bg="${base00}"
  dirlist*.selected.fg="${base05}"
  dirlist*.selected.bg="${base03}"
  dirlist*.selected.bold=true

  completion*.selected.reverse=true
  completion*.selected.bold=true
  completion*.bg="${base01}"
  completion*.fg="${base05}"

  tab.bg="${base01}"
  tab.fg="${base04}"

  border.bg="${base00}"
  border.fg="${base01}"
  spinner.fg="${base03}"

  selector_focused.reverse=true
  selector_chooser.bold=true
''
