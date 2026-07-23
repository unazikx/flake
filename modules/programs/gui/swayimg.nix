{
  ...
}:

{
  zen.programs.gui.swayimg = {
    description = ''
      best image viewer
      with gallery vies
      glitches on niri?
    '';

    homeManager =
      {
        config,
        ...
      }:
      {
        programs.swayimg = {
          enable = true;

          # settings = {
          #   # keep-sorted start block=yes case=no
          #   "info.gallery" = {
          #     top_left = "none";
          #     top_right = "index";
          #     bottom_left = "none";
          #     bottom_right = "none";
          #   };
          #   "info.viewer" = {
          #     top_left = "+name,+imagesize";
          #     top_right = "index";
          #     bottom_left = "status";
          #     bottom_right = "scale";
          #   };
          #   "keys.gallery" = {
          #     F1 = "help";
          #     Space = "mode viewer";
          #     Return = "mode viewer`";
          #     Home = "first_file";
          #     g = "first_file";
          #     End = "last_file";
          #     "Shift+g" = "last_file";
          #     Left = "step_left";
          #     Right = "step_right";
          #     Up = "step_up";
          #     Down = "step_down";
          #     h = "step_left";
          #     j = "step_down";
          #     k = "step_up";
          #     l = "step_right";
          #     Prior = "page_up";
          #     Next = "page_down";
          #     f = "fullscreen";
          #     a = "antialiasing";
          #     r = "reload";
          #     i = "info";
          #     q = "exit";
          #     Escape = "exit";
          #     "Delete" = ''exec trash put "%"; skip_file'';
          #     "Shift+Delete" = ''exec rm "%"; skip_file'';
          #     ScrollUp = "page_up";
          #     ScrollDown = "page_down";
          #     y = "exec wl-copy < '%'; status 'Copied image'";
          #     "Shift+y" = "exec wl-copy '%'; status 'Copied image path'";
          #   };
          #   "keys.viewer" = {
          #     F1 = "help";
          #     "Space" = "mode gallery";
          #     Return = "mode gallery";
          #     "Delete" = ''exec trash put "%"; skip_file'';
          #     "Shift+Delete" = ''exec rm "%"; skip_file'';
          #     Home = "first_file";
          #     g = "first_file";
          #     End = "last_file";
          #     "Shift+g" = "last_file";
          #     "Shift+Space" = "next_file";
          #     Next = "next_file";
          #     Prior = "prev_file";
          #     j = "next_file";
          #     k = "prev_file";
          #     "0" = "zoom real";
          #     Equal = "zoom +10";
          #     Plus = "zoom +10";
          #     Minus = "zoom -10";
          #     w = "zoom width";
          #     "Shift+w" = "zoom height";
          #     z = "zoom fit";
          #     "Shift+z" = "zoom fill";
          #     h = "zoom +10";
          #     l = "zoom -10";
          #     Left = "step_left 10";
          #     Right = "step_right 10";
          #     Up = "step_up 10";
          #     Down = "step_down 10";
          #     bracketleft = "rotate_left";
          #     bracketright = "rotate_right";
          #     m = "flip_vertical";
          #     "Shift+m" = "flip_horizontal";
          #     f = "fullscreen";
          #     a = "antialiasing";
          #     r = "reload";
          #     i = "info";
          #     q = "exit";
          #     Escape = "exit";
          #     "Ctrl+ScrollUp" = "zoom +10";
          #     "Ctrl+ScrollDown" = "zoom -10";
          #     "Shift+ScrollUp" = "prev_file";
          #     "Shift+ScrollDown" = "next_file";
          #     y = "exec wl-copy < '%'; status 'Copied image'";
          #     "Shift+y" = "exec wl-copy '%'; status 'Copied image path'";
          #   };
          #   font = {
          #     name = fonts.sansSerif.name;
          #     size = toString (fonts.sizes.applications + 2);
          #     color = colors.base06 + "ff";
          #     shadow = colors.base00 + "a0";
          #   };
          #   gallery = {
          #     size = "400";
          #     cache = "100";
          #     antialiasing = "none";
          #     window = colors.base00 + "ff";
          #     background = colors.base01 + "ff";
          #     select = colors.base02 + "ff";
          #     preload = "yes";
          #   };
          #   general = {
          #     mode = "viewer";
          #     position = "auto";
          #     size = "fullscreen";
          #     sigusr1 = "reload";
          #     sigusr2 = "next_file";
          #     app_id = "swayimg";
          #   };
          #   info = {
          #     show = "yes";
          #     info_timeout = "1";
          #     status_timeout = "1";
          #   };
          #   list = {
          #     order = "alpha";
          #     recursive = "no";
          #     all = "yes";
          #   };
          #   viewer = {
          #     window = "#000000" + "ff";
          #     transparency = "grid";
          #     scale = "optimal";
          #     antialiasing = "none";
          #     history = "5";
          #     preload = "5";
          #   };
          #   # keep-sorted end
          # };
        };
      };
  };
}
