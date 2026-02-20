{
  pkgs,
  lib,
  config,
  ...
}:

let
  inherit (pkgs)
    writeTextFile
    ;

  inherit (lib)
    types
    mkOption
    concatMapStringsSep
    ;

  inherit (builtins)
    map
    attrValues
    ;

  collection = lib.mkOption {
    default = { };
    type = types.attrsOf (
      types.submodule (
        { name, ... }:
        {
          options = {
            name = mkOption {
              type = types.str;
              default = name;
            };
            includes = mkOption {
              default = [ ];
              type = with types; listOf str;
            };
            excludes = mkOption {
              default = [ ];
              type = with types; listOf str;
            };
            text = mkOption {
              type = types.str;
            };
          };
        }
      )
    );
  };
in

{
  options = {
    programs.qutebrowser = {
      whitelist = collection;
      userstyle = collection;
    };
  };

  config = {
    programs.qutebrowser.greasemonkey =
      let
        mkWhitelist =
          whitelist:
          let
            includes' = concatMapStringsSep "\n" (include: "// @match ${include}") whitelist.includes;
          in
          (writeTextFile {
            name = "style-${whitelist.name}.js";
            text = # js
              ''
                // ==UserScript==
                // @name    Userstyle ${whitelist.name}
                // @run-at  document-end
                ${includes'}
                // ==/UserScript==

                ${whitelist.text}
              '';
          });
        mkUserstyle =
          userstyle:
          let
            includes' = concatMapStringsSep "\n" (include: "// @include ${include}") userstyle.includes;
          in
          (writeTextFile {
            name = "style-${userstyle.name}.js";
            text = # js
              ''
                // ==UserScript==
                // @name    Userstyle ${userstyle.name}
                // @run-at  document-end
                ${includes'}
                // ==/UserScript==

                GM_addStyle(`
                ${userstyle.text}
                `)
              '';
          });
      in
      map mkWhitelist (attrValues config.programs.qutebrowser.whitelist)
      ++ map mkUserstyle (attrValues config.programs.qutebrowser.userstyle);
  };
}
