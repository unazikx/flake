{
  ...
}:

{
  zen.programs.gui.firefox.profiles = {
    homeManager =
      {
        inputs,
        pkgs,
        lib,
        config,
        user,
        ...
      }:
      {
        programs.firefox = {
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

            userContent =
              with config.lib.stylix.colors.withHashtag;
              # css
              ''
                /* background setting */
                @-moz-document ${
                  [
                    ''url("about:home")''
                    ''url("about:newtab")''
                  ]
                  |> lib.concatStringsSep ", "
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

            extraConfig =
              (
                [
                  # keep-sorted start
                  "${inputs.betterfox}/Fastfox.js"
                  "${inputs.betterfox}/Peskyfox.js"
                  "${inputs.betterfox}/Securefox.js"
                  "${inputs.betterfox}/Smoothfox.js"
                  "${inputs.betterfox}/user.js"
                  # keep-sorted end
                ]
                |> map (file: lib.readFile file)
              )
              |> lib.concatStringsSep "\n";
          };
        };
      };
  };
}
