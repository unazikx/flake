{
  ...
}:

{
  zen.programs.gui.qutebrowser.userstyles = {
    homeManager =
      {
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
        fonts = config.stylix.fonts;
      in
      {
        programs.qutebrowser.userstyle = {
          "start" = {
            includes = [ "qute://*" ];
            text =
              # css
              ''
                /* everywhere */
                body {
                  background-color:  ${colors.base00};
                  font-family:      "${fonts.sansSerif.name}" !important;
                }

                h1 {
                  color: ${colors.base05};
                  font-weight: normal;
                }

                a {
                  text-decoration: none;
                  color: ${colors.base0B};
                }

                /* history */
                .date {
                  color:          ${colors.base04};
                  font-size:      ${toString (fonts.sizes.applications - 2)}pt;
                  padding-bottom: 15px;
                  text-align:     right;
                }

                .hostname {
                  color:           ${colors.base04};
                  font-size:       0.9em;
                  margin-left:     10px;
                }

                td.time {
                  color:       ${colors.base04};
                  text-align:  right;
                  white-space: nowrap;
                }

                /* startpage */
                input {
                  color:             ${colors.base04};
                  background-color:  ${colors.base01};
                  border-radius:     8px !important;
                  font-family:      "${fonts.sansSerif.name}" !important;
                }

                .bookmarks { display:    none;   }
                .header    { margin-top: 220px;  }
                .logo      { visibility: hidden; }
              '';
          };

          "github" = {
            includes = [ "*github.com*" ];
            text =
              # css
              ''
                #profile-lists-container .Box {
                  background: transparent;
                  border: none;
                  box-shadow: none;
                }

                #profile-lists-container .Box-row {
                  border: 1px solid var(--borderColor-muted) !important;
                  border-radius: 8px !important;
                  margin-bottom: 8px;
                  background: var(--bgColor-default);
                  padding: 0 !important;
                  transition: background 0.15s ease, border-color 0.15s ease;
                }

                #profile-lists-container .Box-row:hover {
                  background: var(--bgColor-muted);
                  border-color: var(--borderColor-default) !important;
                }

                #profile-lists-container .Box-row > .d-flex {
                  display: grid !important;
                  grid-template-columns: minmax(150px, 220px) 1fr auto;
                  align-items: center !important;
                  column-gap: 10px;
                  padding: 8px 12px !important;
                }

                #profile-lists-container .wb-break-word {
                  font-size: 0.85rem;
                  line-height: 1.35;
                  opacity: 0.85;
                  word-break: break-word;
                }

                #profile-lists-container .text-small.no-wrap {
                  font-size: 0.75rem;
                  padding: 3px 8px;
                  border-radius: 999px;
                  background: var(--bgColor-muted);
                  border: 1px solid var(--borderColor-muted);
                  font-weight: 500;
                  display: flex;
                  align-items: center;
                  justify-content: center;
                  white-space: nowrap;
                }

                #profile-lists-container .Details-content--shown,
                #profile-lists-container .Details-content--shown footer {
                  border: none !important;
                  background: transparent;
                }

                #profile-lists-container .js-details-target {
                  width: 100%;
                  border: 1px solid var(--borderColor-muted);
                  border-radius: 8px;
                  background: var(--bgColor-default);
                  font-size: 0.85rem;
                  padding: 8px 10px !important;
                  margin-bottom: 0 !important;
                  transition: background 0.15s ease, border-color 0.15s ease;
                }

                #profile-lists-container .js-details-target:hover {
                  background: var(--bgColor-muted);
                  border-color: var(--borderColor-default);
                  text-decoration: none;
                }
              '';
          };
        };
      };
  };
}
