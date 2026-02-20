{
  vim = {
    filetree = {
      neo-tree = {
        enable = true;

        setupOpts = {
          add_blank_line_at_top = true;
        };
      };
    };

    keymaps = [
      {
        key = "<LEADER><TAB>";
        action = "<CMD>Neotree toggle focus<CR>";
        desc = "Toggle filetree (neo-tree)";
        mode = "n";
        silent = true;
      }
    ];
  };
}
