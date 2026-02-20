{
  normal = {
    y = "yank";
    Y = "yank_to_clipboard";
    D = "delete_selection_noyank";
    g.q = ":buffer-close";

    space = {
      space = "file_picker";
      c = "toggle_comments";
      f = "file_picker_in_current_directory";
      F = "file_picker";

      b = {
        b = "buffer_picker";
        n = ":buffer-next";
        p = ":buffer-previous";
        q = ":buffer-close";
        Q = ":buffer-close!";
        O = ":buffer-close-others";
      };
    };
  };

  insert = { };
  select = { };
}
