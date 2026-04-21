# INFO:
# one of the best browsers ever

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          inputs,
          pkgs,
          lib,
          config,
          ...
        }:
        let
          settings = import ./settings.nix {
            inherit
              lib
              config
              ;
          };
        in
        {
          hm.programs.librewolf = {
            enable = true;

            nativeMessagingHosts =
              [ ] ++ (lib.optionals config.hm.programs.keepassxc.enable [ pkgs.keepassxc ]);

            inherit (settings)
              policies
              ;

            profiles.${lib.userName} = {
              settings = settings.profile;

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

              extensions = {
                force = true;

                settings = settings.extensions;
                packages = import ./extensions.nix {
                  inherit
                    pkgs
                    lib
                    config
                    ;
                };
              };

              bookmarks = {
                meta.maintainers = [ lib.maintainers.azikxz ];
                settings = settings.bookmarks;
                force = true;
              };

              userChrome = lib.readFile pkgs.own.firefox-themes.little-fox;

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

          hmMime = lib.mkMime {
            "spotify.desktop" = [
              "x-scheme-handler/spotify"
              "x-scheme-handler/https"
            ];

            "librewolf.desktop" = [
              "text/html"
              "x-scheme-handler/http"
              "x-scheme-handler/https"
              "x-scheme-handler/chrome"
              "x-scheme-handler/about"
              "x-scheme-handler/unknown"
            ];
          };
        };
    };
}
