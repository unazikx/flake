{
  keys = import ./binds.nix;

  editor = {
    auto-completion = true;
    auto-info = true;
    auto-pairs = true;
    bufferline = "multiple";
    color-modes = true;
    completion-replace = true;
    cursorline = true;
    line-number = "relative";
    mouse = true;
    true-color = true;

    indent-guides = {
      render = true;
      character = "▎";
      skip-levels = 0;
    };

    cursor-shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };

    soft-wrap = {
      enable = true;
      max-wrap = 25;
      wrap-indicator = "┆ ";
    };

    statusline = {
      left = [
        "mode"
        "spacer"
        "spinner"
        "file-name"
        "file-modification-indicator"
        "read-only-indicator"
      ];

      center = [ ];

      right = [
        "register"
        "file-type"
        "separator"
        "spacer"
        "position"
        "position-percentage"
        "spacer"
        "separator"
        "total-line-numbers"
        "spacer"
      ];

      separator = "|";
      mode.normal = "NORMAL";
      mode.insert = "INSERT";
      mode.select = "SELECT";
    };

    lsp = {
      display-progress-messages = true;
      display-inlay-hints = true;
    };

    file-picker.hidden = false;
  };
}
