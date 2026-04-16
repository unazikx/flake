{
  lib,
  ...
}:

{
  config.vim = {
    mini = lib.mkMerge [
      (lib.genAttrs
        [
          # keep-sorted start
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
          # keep-sorted end
        ]
        (_: {
          enable = true;
        })
      )
    ];
  };
}
