{
  inputs,
  pkgs,
  lib,
  blackList,
  ...
}:

let
  args = lib.concatStringsSep " " (
    map (
      domain:
      let
        escapedDomain = lib.escape [
          "."
          "*"
          "["
          "]"
          "^"
          "$"
          "+"
          "?"
          "|"
          "("
          ")"
          "/"
        ] domain;
      in
      "-e '/.*${escapedDomain}.*/d'"
    ) blackList
  );
in

lib.readFile (
  pkgs.runCommand "modified-hosts"
    {
      preferLocalBuild = true;
    }
    ''
      sed ${args} ${inputs.dns-malw-link.outPath}/hosts > $out
    ''
)
