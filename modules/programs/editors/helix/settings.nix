{
  ...
}:

{
  zen.programs.editors.helix.settings = {
    homeManager =
      {
        ...
      }:
      {
        programs.helix.settings = {
          editor = {
            auto-completion = true;

            auto-info = true;

            auto-pairs = true;

            bufferline = "multiple";

            color-modes = true;

            completion-replace = true;

            cursor-shape = {
              insert = "bar";
              normal = "block";
              select = "underline";
            };

            cursorline = true;

            file-picker.hidden = false;

            indent-guides = {
              render = true;
              character = "▎";
              skip-levels = 0;
            };

            line-number = "relative";

            lsp = {
              display-progress-messages = true;
              display-inlay-hints = true;
            };

            mouse = true;

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

            true-color = true;
          };
        };
      };
  };
}
