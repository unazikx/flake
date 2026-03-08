let
  X = "map --mode x";
  W = "map --mode w";
  b = ": pop_keyboard_mode";
in

''
  # mk mods
  map  --new-mode x alt+space
  ${X} --new-mode w w
  # exit
  ${X} esc      pop_keyboard_mode
  ${X} space    pop_keyboard_mode
  ${W} esc      combine : pop_keyboard_mode : pop_keyboard_mode
  ${W} space    combine : pop_keyboard_mode : pop_keyboard_mode

  # main
  ${X} =        set_background_opacity +0.1
  ${X} -        set_background_opacity -0.1
  ${X} 0        set_background_opacity default

  # switch tabs
  ${X} a        combine : new_tab ${b}
  ${X} d        combine : close_tab ${b}
  ${X} t        combine : set_tab_title ${b}
  ${X} j        next_tab
  ${X} k        previous_tab
  ${X} shift+j  move_tab_forward
  ${X} shift+k  move_tab_backward
  ${X} n        combine : detach_tab ${b}
  ${X} shift+n  combine : detach_tab ask ${b}

  # windows
  ${W} a        new_window
  ${W} d        close_window
  ${W} r        start_resizing_window
  ${W} j        next_window
  ${W} k        previous_window
  ${W} shift+j  move_window_forward
  ${W} shift+k  move_window_backward
  ${W} n        detach_window new-tab
  ${W} shift+n  detach_window ask
''
