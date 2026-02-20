{
  sway,
  ...
}:

let
  inherit (sway)
    gaps
    ;

  inner = "gaps inner ";
  outer = "gaps outer ";

  exitMode = {
    "Return" = "mode default";
    "Escape" = "mode default";
  };
in

{
  gapsMode = {
    d =
      inner + "all set ${toString gaps.inner}, " + inner + "all set ${toString gaps.outer}, mode default";
    n = inner + "all set 0, " + outer + "all set 0, mode default";
    i = "mode innerGapsMode";
    o = "mode outerGapMode";
  }
  // exitMode;

  innerGapsMode = {
    plus = inner + "current plus 5";
    minus = inner + "current minus 5";
    "0" = inner + "current set 0";
    "shift+plus" = inner + "all plus 5";
    "shift+minus" = inner + "all minus 5";
    "shift+0" = inner + "all set 0";
  }
  // exitMode;

  outerGapsMode = {
    plus = outer + "current plus 5";
    minus = outer + "current minus 5";
    "0" = outer + "current set 0";
    "shift+plus" = outer + "all plus 5";
    "shift+minus" = outer + "all minus 5";
    "shift+0" = outer + "all set 0";
  }
  // exitMode;
}
