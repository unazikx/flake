{
  ...
}:

{
  config.vim = {
    keymaps = [
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = ":lua MiniFiles.open()<CR>";
        desc = "Opens Mini.Files in current dir";
      }
      {
        key = "<leader>E";
        mode = "n";
        silent = true;
        action = ":lua MiniFiles.open()<CR>";
        desc = "Opens Mini.Files in cwd";
      }
    ];
  };
}
