{
  lib,
  ...
}:

{
  config.vim = {
    mini = lib.mkMerge [
      (lib.genAttrs
        [
          "comment"
          "completion"
          "cursorword"
          "extra"
          "files"
          "git"
          "icons"
          "indentscope"
          "jump"
          "pairs"
          "statusline"
          "surround"
          "tabline"
        ]
        (_: {
          enable = true;
        })
      )
    ];
  };
}
