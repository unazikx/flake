{
  ...
}:

{
  zen.programs.gui.librewolf.profiles = {
    homeManager =
      {
        self',
        inputs,
        pkgs,
        lib,
        config,
        user,
        ...
      }:
      {
        programs.librewolf = {
          profiles.${user.userName} = {
            search = {
              force = true;

              default = "google";
              engines = {
                "google" = {
                  urls = [
                    {
                      template = "https://google.com/search";
                      params = [
                        {
                          name = "q";
                          value = "{searchTerms}";
                        }
                      ];
                    }
                  ];

                  icon = pkgs.fetchurl {
                    url = "https://www.google.com/favicon.ico";
                    sha256 = "sha256-baViCIAVljQhPhl/r8od3gJyFTvj5FkIGFM/q40EB3A=";
                  };
                };
              };
            };

            userChrome = lib.readFile self'.legacyPackages.firefox-themes.little-fox;

            userContent =
              with config.lib.stylix.colors.withHashtag;
              # css
              ''
                /* background setting */
                @-moz-document ${
                  lib.concatStringsSep ", " [
                    ''url("about:home")''
                    ''url("about:newtab")''
                  ]
                } {
                  body {
                    background-position: center !important;
                    background-repeat: no-repeat !important;
                    background-attachment: fixed !important;
                    backdrop-filter: blur(4px) saturate(180%) brightness(0.7) !important;
                  }
                }

                /* searchbar colorize */
                .search-wrapper .search-handoff-button, .search-wrapper input {
                	background: ${base01} !important;
                	border-radius: 96px !important;
                	color: ${base05} !important;
                }

                /* hide right-bottom button */
                .personalizeButtonWrapper { display: none !important; }
              '';

            extraConfig = lib.concatStringsSep "\n" (
              map (file: lib.readFile file) [
                # keep-sorted start
                "${inputs.betterfox}/Fastfox.js"
                "${inputs.betterfox}/Peskyfox.js"
                "${inputs.betterfox}/Securefox.js"
                "${inputs.betterfox}/Smoothfox.js"
                "${inputs.betterfox}/user.js"
                # keep-sorted end
              ]
            );
          };
        };
      };
  };
}
