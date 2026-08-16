{
  zen.custom.qutebrowser = {
    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.qutebrowser;

        collection = lib.mkOption {
          default = { };
          type = lib.types.attrsOf (
            lib.types.submodule (
              {
                name,
                ...
              }:
              {
                options = {
                  name = lib.mkOption {
                    type = lib.types.str;
                    default = name;
                  };
                  includes = lib.mkOption {
                    default = [ ];
                    type = lib.types.listOf lib.types.str;
                  };
                  excludes = lib.mkOption {
                    default = [ ];
                    type = lib.types.listOf lib.types.str;
                  };
                  text = lib.mkOption {
                    type = lib.types.str;
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

        config = lib.mkIf cfg.enable {
          programs.qutebrowser.greasemonkey =
            let
              mkWhitelist =
                whitelist:
                (pkgs.writeTextFile {
                  name = "style-${whitelist.name}.js";
                  text =
                    # javascript
                    ''
                      // ==UserScript==
                      // @name    Userstyle ${whitelist.name}
                      // @run-at  document-end
                      ${lib.concatMapStringsSep "\n" (include: "// @match ${include}") whitelist.includes}
                      // ==/UserScript==

                      ${whitelist.text}
                    '';
                });

              mkUserstyle =
                userstyle:
                (pkgs.writeTextFile {
                  name = "style-${userstyle.name}.js";
                  text =
                    # javascript
                    ''
                      // ==UserScript==
                      // @name    Userstyle ${userstyle.name}
                      // @run-at  document-end
                      ${lib.concatMapStringsSep "\n" (include: "// @include ${include}") userstyle.includes}
                      // ==/UserScript==

                      GM_addStyle(`
                      ${userstyle.text}
                      `)
                    '';
                });
            in
            map mkWhitelist (lib.attrValues cfg.whitelist) ++ map mkUserstyle (lib.attrValues cfg.userstyle);
        };
      };
  };
}
