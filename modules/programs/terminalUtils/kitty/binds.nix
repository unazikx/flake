{
  config,
  ...
}:

# "ctrl+shift"
let
  inherit (config.hm.programs.kitty.settings)
    kitty_mod
    ;
in

{
  "${kitty_mod}+esc" = "clear_selection";
  "f11" = "toggle_fullscreen";

  "${kitty_mod}+c" = "copy_to_clipboard";
  "${kitty_mod}+v" = "paste_from_clipboard";

  "insert" = "paste_from_selection";
  "shift+insert" = "copy_to_clipboard";

  "${kitty_mod}+]" = "set_background_opacity +0.1";
  "${kitty_mod}+[" = "set_background_opacity -0.1";

  "${kitty_mod}+equal" = "change_font_size all +2.0";
  "${kitty_mod}+plus" = "change_font_size all +2.0";
  "${kitty_mod}+minus" = "change_font_size all -2.0";
  "${kitty_mod}+backspace" = "change_font_size all 0";

  "page_up" = "scroll_page_up";
  "page_down" = "scroll_page_down";
  "ctrl+page_up" = "scroll_line_up";
  "ctrl+page_down" = "scroll_line_down";
}
