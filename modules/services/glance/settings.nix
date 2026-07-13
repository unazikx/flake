{
  ...
}:

{
  zen.services.glance.settings = {
    nixos =
      {
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
      in
      {
        services.glance.settings = {
          server = {
            port = 5678;
            host = "0.0.0.0";
            proxied = config.services.caddy.enable;
          };

          branding = {
            app-name = "Glance - homepage";
            logo-text = "󱄅";

            app-background-color = colors.withHashtag.base00;

            # hide-footer = true;
            custom-footer = "<b><p>ᓚᘏᗢ</p></b>";
          };

          theme = lib.mkForce {
            contrast-multiplier = 1.0;
            background-color = lib.mkHsl colors "base00";
            primary-color = lib.mkHsl colors "base05";
            positive-color = lib.mkHsl colors "base0A";
            negative-color = lib.mkHsl colors "base08";
            light = false;

            presets = {
              stylix-dark = {
                contrast-multiplier = 1.0;
                background-color = lib.mkHsl colors "base00";
                primary-color = lib.mkHsl colors "base05";
                positive-color = lib.mkHsl colors "base0A";
                negative-color = lib.mkHsl colors "base08";
                light = false;
              };

              stylix-light = {
                contrast-multiplier = 1.0;
                background-color = lib.mkHsl colors "base05";
                primary-color = lib.mkHsl colors "base00";
                positive-color = lib.mkHsl colors "base0B";
                negative-color = lib.mkHsl colors "base08";
                light = true;
              };
            };
          };

          pages = [
            {
              name = "Home";

              hide-desktop-navigation = true;
              show-mobile-header = true;

              center-vertically = true;
              width = "slim";

              head-widgets = [
                {
                  type = "search";
                  search-engine = "https://4get.nadeko.net/web?s={QUERY}";
                  # 4get cause if anonimus, so be anonimus
                  # soon i will host 4get on my own

                  new-tab = true;

                  bangs = [
                    {
                      title = "YouTube";
                      shortcut = "!yt";
                      url = "https://www.youtube.com/results?search_query={QUERY}";
                    }

                    {
                      title = "Rutracker";
                      shortcut = "!rt";
                      url = "https://rutracker.org/forum/tracker.php?nm={QUERY}";
                    }

                    {
                      title = "Nitter";
                      shortcut = "!nt";
                      url = "https://nitter.net/search?q={QUERY}";
                    }

                    {
                      title = "Binternet";
                      shortcut = "!bn";
                      url = "https://binternet.private.coffee/search.php?q={QUERY}";
                    }

                    {
                      title = "PixivFE";
                      shortcut = "!pi";
                      url = "http://pixivfe.ducks.party/search?name={QUERY}";
                    }

                    {
                      title = "Anilist (manga)";
                      shortcut = "!alm";
                      url = "https://anilist.co/search/manga?search={QUERY}";
                    }

                    {
                      title = "Anilist (anime)";
                      shortcut = "!ala";
                      url = "https://anilist.co/search/anime?search={QUERY}";
                    }

                    {
                      title = "Intellectual";
                      shortcut = "!in";
                      url = "http://intellectual.ducks.party/search?q={QUERY}";
                    }
                  ];
                }
              ];

              columns = [
                {
                  size = "small";
                  widgets = [
                    {
                      type = "group";
                      widgets = [
                        {
                          type = "clock";
                          hour-format = "24h";
                        }
                        {
                          type = "server-stats";
                          servers = [
                            {
                              type = "local";
                              name = "Services";
                              hide-swap = true;
                              hide-mountpoints-by-default = true;
                              mountpoints = {
                                "/" = {
                                  name = "root";
                                  hide = false;
                                };
                              };
                            }
                          ];
                        }
                      ];
                    }
                    {
                      type = "group";
                      widgets = [
                        {
                          type = "weather";
                          location = "Tynda, Russia";
                          hide-location = true;
                          hour-format = "24h";
                        }
                        {
                          type = "calendar";
                        }
                      ];
                    }
                  ];
                }
                {
                  size = "full";
                  widgets = [
                    {
                      type = "group";
                      widgets = [
                        {
                          type = "bookmarks";
                          hide-arrow = true;
                          groups =
                            let
                              https = "https://";

                              # GREAT OVER-ENGINEERING
                              website =
                                address: args:
                                {
                                  url = https + address;
                                  icon = https + args.icon;
                                }
                                // args;
                            in
                            [
                              {
                                title = "General links...";
                                same-tab = true;
                                color = lib.mkHsl colors "base08";
                                links = [
                                  (website "mail.google.com" {
                                    title = "Gmail";
                                    icon = "icons.ly/gmail/${colors.base08}";
                                  })

                                  (website "youtube.com" {
                                    title = "Youtube";
                                    icon = "icons.ly/youtube/${colors.base09}";
                                  })

                                  (website "github.com" {
                                    title = "Github";
                                    icon = "icons.ly/github/${colors.base0F}";
                                  })

                                  (website "chat.deepseek.com" {
                                    title = "Deepseek";
                                    icon = "icons.ly/chatbot/${colors.base0D}";
                                  })

                                  (website "claude.ai" {
                                    title = "Claude AI";
                                    icon = "icons.ly/claude/${colors.base09}";
                                  })
                                ];
                              }
                              {
                                title = "NixOS useful...";
                                same-tab = true;
                                color = lib.mkHsl colors "base0D";
                                links = [
                                  (website "search.nixos.org/options?channel=unstable" {
                                    title = "NixOS Search";
                                    icon = "icons.ly/nixos/${colors.base0D}";
                                  })

                                  (website "home-manager-options.extranix.com/?query=&release=master" {
                                    title = "Home-Manager Search";
                                    icon = "icons.ly/nixos/${colors.base0C}";
                                  })

                                  (website "wiki.nixos.org" {
                                    title = "NixOS Wiki";
                                    icon = "icons.ly/nixos/${colors.base0E}";
                                  })
                                ];
                              }

                              {
                                title = "Social...";
                                same-tab = true;
                                color = lib.mkHsl colors "base0B";
                                links = [
                                  (website "anilist.co" {
                                    title = "Anilist";
                                    icon = "icons.ly/anilist/${colors.base0D}";
                                  })

                                  (website "anichart.net" {
                                    title = "Anichart";
                                    icon = "icons.ly/anichart/${colors.base0C}";
                                  })

                                  (website "binternet.private.coffee" {
                                    title = "Binternet";
                                    icon = "icons.ly/pinterest/${colors.base08}";
                                  })

                                  (website "simplytranslate.ducks.party" {
                                    title = "Translate";
                                    icon = "icons.ly/googletranslate/${colors.base0D}";
                                  })

                                  (website "intellectual.ducks.party" {
                                    title = "Intellectual";
                                    icon = "icons.ly/genius/${colors.base0A}";
                                  })
                                ];
                              }
                            ];
                        }
                        {
                          type = "releases";
                          repositories = [
                            "Alexays/Waybar"
                            "Anuken/Mindustry"
                            "Anuken/MindustryBuilds"
                            "artemsen/swayimg"
                            "AyuGram/AyuGramDesktop"
                            "bol-van/zapret"
                            "derrod/legendary"
                            "dundee/gdu"
                            "ebkr/r2modmanPlus"
                            "fish-shell/fish-shell"
                            "helix-editor/helix"
                            "hyprwm/Hyprland"
                            "keepassxreboot/keepassxc"
                            "lutris/lutris"
                            "mindstorm38/portablemc"
                            "mpv-player/mpv"
                            "PrismLauncher/PrismLauncher"
                            "qbittorrent/qBittorrent"
                            "qutebrowser/qutebrowser"
                            "sxyazi/yazi"
                            "syncthing/syncthing"
                            "talwat/lowfi"
                            "TDesktop-x64/tdesktop"
                            "unmojang/FjordLauncher"
                            "Vencord/Vesktop"
                            "YaLTeR/niri"
                            "YouROK/TorrServer"
                          ];

                          token = "\${GITHUB}";
                        }
                        {
                          type = "twitch-channels";
                          channels = [
                            "ZakvielChannel"
                          ];
                        }
                        {
                          type = "twitch-top-games";
                        }
                        {
                          type = "lobsters";
                          sort-by = "hot";
                          tags = [
                            "android"
                            "linux"
                            "nix"
                            "web"
                            "email"
                          ];
                        }
                      ];
                    }
                  ];
                }
              ];
            }
          ];
        };
      };
  };
}
