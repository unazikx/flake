{
  lib,
  config,

  isRu,
  mkHsl,
  ...
}:

with lib;

{
  server = {
    port = 5678;
    host = "0.0.0.0";
    proxied = config.services.caddy.enable;
  };

  branding = {
    app-name = "Glance - homepage";
    logo-text = "󱄅";

    app-background-color = config.lib.stylix.colors.withHashtag.base00;

    # hide-footer = true;
    custom-footer = "<b><p>ᓚᘏᗢ</p></b>";
  };

  theme = mkForce {
    contrast-multiplier = 1.0;
    background-color = mkHsl "base00";
    primary-color = mkHsl "base05";
    positive-color = mkHsl "base0A";
    negative-color = mkHsl "base08";
    light = false;

    presets = {
      stylix-dark = {
        contrast-multiplier = 1.0;
        background-color = mkHsl "base00";
        primary-color = mkHsl "base05";
        positive-color = mkHsl "base0A";
        negative-color = mkHsl "base08";
        light = false;
      };

      stylix-light = {
        contrast-multiplier = 1.0;
        background-color = mkHsl "base05";
        primary-color = mkHsl "base00";
        positive-color = mkHsl "base0B";
        negative-color = mkHsl "base08";
        light = true;
      };
    };
  };

  pages = [
    {
      name = "Home";

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
          size = "full";
          widgets = [
            {
              type = "custom-api";
              title = "qBittorrent";
              cache = "3s";

              options = {
                view = "basic";
                mode = "default";
              };

              subrequests =
                let
                  cfg = config.services.qbittorrent;
                  url = "http://localhost:${toString cfg.webuiPort}/api/v2/transfer/info";
                in
                {
                  transfer = {
                    inherit url;
                  };

                  seeding = {
                    parameters.filter = "seeding";
                    inherit url;
                  };

                  leeching = {
                    parameters.filter = "downloading";
                    inherit url;
                  };
                };

              template = ''
                {{ $transfer := .Subrequest "transfer" }}
                {{ $seeding := .Subrequest "seeding" }}
                {{ $leeching := .Subrequest "leeching" }}

                {{ if and (eq $transfer.Response.StatusCode 200) (eq $seeding.Response.StatusCode 200) (eq $leeching.Response.StatusCode 200) }}

                  {{ $isDetailed := eq (.Options.StringOr "view" "detailed") "detailed" }}
                  {{ $mode := .Options.StringOr "mode" "default" }}

                  {{ if $isDetailed }}
                  <!-- Detailed View -->
                  <div class="list" style="--list-gap: 15px;">
                    <div class="flex justify-between text-center">
                      <div>
                        {{ $dlSpeed := $transfer.JSON.Float "dl_info_speed" }}
                        {{ if eq $mode "upload" }}
                          <div class="color-highlight size-h3">{{ printf "%.1f MB/s" (div $dlSpeed 1000000.0) }}</div>
                        {{ else }}
                          {{ if lt $dlSpeed 1048576.0 }}
                            <div class="color-highlight size-h3">{{ printf "%.0f KiB/s" (div $dlSpeed 1024.0) }}</div>
                          {{ else }}
                            <div class="color-highlight size-h3">{{ printf "%.1f MiB/s" (div $dlSpeed 1048576.0) }}</div>
                          {{ end }}
                        {{ end }}
                        <div class="size-h6">DOWNLOADING</div>
                      </div>

                      {{ if eq $mode "upload" }}
                      <div>
                        {{ $ulSpeed := $transfer.JSON.Float "up_info_speed" }}
                        <div class="color-highlight size-h3">{{ printf "%.1f MB/s" (div $ulSpeed 1000000.0) }}</div>
                        <div class="size-h6">UPLOADING</div>
                      </div>
                      {{ end }}

                      <div>
                        <div class="color-highlight size-h3">{{ len ($seeding.JSON.Array "") }}</div>
                        <div class="size-h6">SEEDING</div>
                      </div>

                      {{ if eq $mode "default" }}
                      <div>
                        <div class="color-highlight size-h3">{{ len ($leeching.JSON.Array "") }}</div>
                        <div class="size-h6">LEECHING</div>
                      </div>
                      {{ end }}
                    </div>

                    <!-- Downloading list -->
                    {{ $downloadingTorrents := $leeching.JSON.Array "" }}
                    {{ if gt (len $downloadingTorrents) 0 }}
                      <div style="margin-top: 15px;">
                        <ul class="list collapsible-container" data-collapse-after="0" style="--list-gap: 15px;">
                          {{ range $t := $downloadingTorrents }}
                            {{ $state := $t.String "state" }}
                            {{ $icon := "?" }}
                            {{ if ge ($t.Int "completed") ($t.Int "size") }}{{ $icon = "✔" }}
                            {{ else if eq $state "downloading" "forcedDL" }}{{ $icon = "↓" }}
                            {{ else if eq $state "pausedDL" "stoppedDL" "pausedUP" "stalledDL" "stalledUP" "queuedDL" "queuedUP" }}{{ $icon = "❚❚" }}
                            {{ else if eq $state "error" "missingFiles" }}{{ $icon = "!" }}
                            {{ else if eq $state "checkingDL" "checkingUP" "allocating" }}{{ $icon = "…" }}
                            {{ else if eq $state "checkingResumeData" }}{{ $icon = "⟳" }}
                            {{ end }}

                            <li class="flex items-center" style="gap: 10px;">
                              <div class="size-h4" style="flex-shrink: 0;">{{ $icon }}</div>
                              <div style="flex-grow: 1; min-width: 0;">
                                <div class="text-truncate color-highlight">{{ $t.String "name" }}</div>
                                <div title="{{ $t.Float "progress" | mul 100 | printf "%.1f" }}%" style="background: rgba(128, 128, 128, 0.2); border-radius: 5px; height: 6px; margin-top: 5px; overflow: hidden;">
                                  <div style="width: {{ $t.Float "progress" | mul 100 }}%; background-color: var(--color-positive); height: 100%; border-radius: 5px;"></div>
                                </div>
                              </div>
                              <div style="flex-shrink: 0; text-align: right; width: 80px;">
                                {{ $dlSpeed := $t.Float "dlspeed" }}
                                <div class="size-sm color-paragraph">
                                  {{ if eq $mode "upload" }}
                                    {{ if lt $dlSpeed 1000.0 }}--{{ else }}{{ printf "%.1f MB/s" (div $dlSpeed 1000000.0) }}{{ end }}
                                  {{ else }}
                                    {{ if lt $dlSpeed 1024.0 }}--{{ else if lt $dlSpeed 1048576.0 }}{{ printf "%.0f KiB/s" (div $dlSpeed 1024.0) }}{{ else }}{{ printf "%.1f MiB/s" (div $dlSpeed 1048576.0) }}{{ end }}
                                  {{ end }}
                                </div>
                                {{ $eta := $t.Int "eta" }}
                                <div class="size-sm color-paragraph">
                                  {{ if eq $eta 8640000 }}∞
                                  {{ else if gt $eta 3600 }}{{ printf "%dh %dm" (div $eta 3600) (mod (div $eta 60) 60) }}
                                  {{ else if gt $eta 0 }}{{ printf "%dm" (div $eta 60) }}
                                  {{ else }}--{{ end }}
                                </div>
                              </div>
                            </li>
                          {{ end }}
                        </ul>
                      </div>
                    {{ end }}

                    <!-- Seeding list -->
                    {{ if eq $mode "upload" }}
                      {{ $seedingTorrents := $seeding.JSON.Array "" }}
                      {{ if gt (len $seedingTorrents) 0 }}
                        <div style="margin-top: 20px;">
                          <ul class="list collapsible-container" data-collapse-after="0" style="--list-gap: 15px;">
                            {{ range $t := $seedingTorrents }}
                              {{ $state := $t.String "state" }}
                              {{ $icon := "↑" }}
                              {{ if eq $state "pausedUP" "stoppedUP" "stalledUP" "queuedUP" }}{{ $icon = "❚❚" }}
                              {{ else if eq $state "error" "missingFiles" }}{{ $icon = "!" }}
                              {{ else if eq $state "checkingUP" }}{{ $icon = "…" }}
                              {{ else if eq $state "checkingResumeData" }}{{ $icon = "⟳" }}
                              {{ end }}

                              <li class="flex items-center" style="gap: 10px;">
                                <div class="size-h4" style="flex-shrink: 0;">{{ $icon }}</div>
                                <div style="flex-grow: 1; min-width: 0;">
                                  <div class="text-truncate color-highlight">{{ $t.String "name" }}</div>
                                  <div class="size-sm color-paragraph">
                                    Ratio: {{ printf "%.2f" ($t.Float "ratio") }} | 
                                    Size: {{ printf "%.1f GB" (div ($t.Float "size") 1073741824.0) }}
                                  </div>
                                </div>
                                <div style="flex-shrink: 0; text-align: right; width: 80px;">
                                  {{ $ulSpeed := $t.Float "upspeed" }}
                                  <div class="size-sm color-paragraph">
                                    {{ if lt $ulSpeed 1000.0 }}--{{ else }}{{ printf "%.1f MB/s" (div $ulSpeed 1000000.0) }}{{ end }}
                                  </div>
                                  <div class="size-sm color-paragraph">Upload</div>
                                </div>
                              </li>
                            {{ end }}
                          </ul>
                        </div>
                      {{ end }}
                    {{ end }}

                  </div>

                  {{ else }}
                  <!-- Basic View -->
                  <div class="flex justify-between text-center">
                    <div>
                      {{ $dlSpeed := $transfer.JSON.Float "dl_info_speed" }}
                      <div class="color-highlight size-h3">{{ printf "%.1f MB/s" (div $dlSpeed 1000000.0) }}</div>
                      <div class="size-h6">DOWNLOADING</div>
                    </div>
                    {{ if eq $mode "upload" }}
                    <div>
                      {{ $ulSpeed := $transfer.JSON.Float "up_info_speed" }}
                      <div class="color-highlight size-h3">{{ printf "%.1f MB/s" (div $ulSpeed 1000000.0) }}</div>
                      <div class="size-h6">UPLOADING</div>
                    </div>
                    {{ end }}
                    <div>
                      <div class="color-highlight size-h3">{{ len ($seeding.JSON.Array "") }}</div>
                      <div class="size-h6">SEEDING</div>
                    </div>
                    {{ if eq $mode "default" }}
                    <div>
                      <div class="color-highlight size-h3">{{ len ($leeching.JSON.Array "") }}</div>
                      <div class="size-h6">LEECHING</div>
                    </div>
                    {{ end }}
                  </div>
                  {{ end }}

                {{ else }}
                  <div class="color-negative text-center">
                    <p>Error fetching qBittorrent data.</p>
                    <p class="size-sm">Check URL and authentication bypass settings.</p>
                  </div>
                {{ end }}
              '';
            }
            {
              type = "custom-api";
              title = "Random Fact";
              cache = "2h";

              # u can use 2 variants of facts:
              # > https://uselessfacts.jsph.pl/api/v2/facts/random
              # > https://uselessfacts.jsph.pl/api/v2/facts/today
              url = "https://uselessfacts.jsph.pl/api/v2/facts/random";
              template = ''
                <p class="size-h4 color-paragraph">{{ .JSON.String "text" }}</p>
              '';
            }
            {
              type = "group";
              widgets = [
                {
                  type = "custom-api";
                  title = "Steam";
                  cache = "12h";

                  # replace cc=ru on cc=us for change currency to USD
                  url = "https://store.steampowered.com/api/featuredcategories?cc=${if isRu then "ru" else "us"}";
                  template = ''
                    <ul class="list list-gap-7 collapsible-container" data-collapse-after="5"> {{ range .JSON.Array "specials.items" }}
                    <li> <a class="size-h4 color-highlight block text-truncate" href="https://store.steampowered.com/app/{{ .Int "id" }}/">{{ .String "name" }}</a> <ul class="list-horizontal-text">
                      <li>{{ div (.Int "final_price" | toFloat) 100 | printf "${
                        if isRu then "%.0f₽" else "%.0f$"
                      }" }}</li>
                      {{ $discount := .Int "discount_percent" }}
                      <li><del style="opacity:0.6">{{ div (.Int "original_price" | toFloat) 100 | printf "${
                        if isRu then "%.0f₽" else "%.0f$"
                      }" }}</del></li>
                      {{ $discount := .Int "discount_percent" }}
                      <li{{ if ge $discount 40 }} class="color-positive"{{ end }}>{{ $discount }}%</li>
                    </ul> </li> {{ end }} </ul>
                  '';
                }
                {
                  type = "custom-api";
                  title = "EGS";
                  cache = "6h";

                  url = "https://store-site-backend-static.ak.epicgames.com/freeGamesPromotions?locale=en&country=${if isRu then "RU" else "US"}";
                  # modified module for fetch epic games discounts
                  template = ''
                    <div>
                      {{ if eq .Response.StatusCode 200 }}
                        <div class="horizontal-cards-2">
                          {{ range .JSON.Array "data.Catalog.searchStore.elements" }}
                            {{ $price := .String "price.totalPrice.discountPrice" }}
                            {{ $originalPrice := .String "price.totalPrice.originalPrice" }}
                            {{ $hasPromo := gt (len (.Array "promotions.promotionalOffers")) 0 }}
                            {{ if and $hasPromo (eq $price "0") }}
                              {{ $gamePage := .String "productSlug" }}
                              {{ if gt (len (.Array "offerMappings")) 0 }}
                                {{ $gamePage = .String "offerMappings.0.pageSlug" }}
                              {{ end }}
                              <div class="card">
                                <div class="card-content">
                                  <a href="https://store.epicgames.com/${
                                    if isRu then "ru" else "en-US"
                                  }/p/{{ $gamePage }}" target="_blank">
                                    <span class="size-h4 color-primary">{{ .String "title" }}</span>
                                  </a>
                                  <br>
                                  <span class="size-h5 color-paragraph">
                                    {{ if $hasPromo }}
                                      {{ $promotions := .Array "promotions.promotionalOffers" }}
                                      {{ if gt (len $promotions) 0 }}
                                        {{ $firstPromo := index $promotions 0 }}
                                        {{ $offers := $firstPromo.Array "promotionalOffers" }}
                                        {{ if gt (len $offers) 0 }}
                                          {{ $firstOffer := index $offers 0 }}
                                          {{ $startDate := $firstOffer.String "startDate" }}
                                          {{ $endDate := $firstOffer.String "endDate" }}
                                          {{ slice $startDate 8 10 }}.{{ slice $startDate 5 7 }}.{{ slice $startDate 0 4 }} - {{ slice $endDate 8 10 }}.{{ slice $endDate 5 7 }}.{{ slice $endDate 0 4 }}
                                          {{ if ne $originalPrice "0" }}
                                            <span class="size-h5"> • <del style="opacity:0.6">
                                              {{ div (.Int "price.totalPrice.originalPrice" | toFloat) 100 | printf "${
                                                if isRu then "%.0f₽" else "%.0f$"
                                              }" }}
                                            </del></span>
                                          {{ end }}
                                        {{ else }}
                                          free this week!
                                        {{ end }}
                                      {{ else }}
                                        free this week!
                                      {{ end }}
                                    {{ end }}
                                  </span>
                                </div>
                              </div>
                            {{ end }}
                          {{ end }}
                        </div>
                      {{ else }}
                        <p class="color-negative">Error fetching Epic Games data!!!</p>
                      {{ end }}
                    </div>
                  '';
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
          ];
        }
        {
          size = "small";
          widgets = [
            {
              type = "clock";
              hour-format = "24h";
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
      ];
    }

    {
      name = "Server info";

      center-vertically = true;
      width = "slim";

      columns = [
        {
          size = "small";
          widgets = [
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
            {
              type = "monitor";
              style = "compact";
              sites = [
                {
                  title = "Flood";
                  url = "https://flood.jetpure.local";
                  allow-insecure = true;
                }
                {
                  title = "QbitTorrent";
                  url = "https://qbittorrent.jetpure.local";
                  allow-insecure = true;
                }
                {
                  title = "Transmission";
                  url = "https://transmission.jetpure.local";
                  allow-insecure = true;
                }
                {
                  title = "Vaultwarden";
                  url = "https://vaulwarden.jetpure.local";
                  allow-insecure = true;
                }
                {
                  title = "Torrserver";
                  url = "https://torrserver.jetpure.local";
                  allow-insecure = true;
                }
              ];
            }
          ];
        }

        {
          size = "full";
          widgets = [
            {
              type = "bookmarks";
              hide-arrow = true;
              groups =
                let
                  https = "https://";

                  # GREAT OVER-ENGINEERING
                  mk =
                    address: args:
                    args
                    // {
                      url = https + address;
                      icon = https + args.icon;
                    };
                in
                with config.lib.stylix.colors;
                [
                  {
                    title = "General links...";
                    same-tab = true;
                    color = mkHsl "base08";
                    links = [
                      (mk "mail.google.com" {
                        title = "Gmail";
                        icon = "icons.ly/gmail/${base08}";
                      })

                      (mk "youtube.com" {
                        title = "Youtube";
                        icon = "icons.ly/youtube/${base09}";
                      })

                      (mk "github.com" {
                        title = "Github";
                        icon = "icons.ly/github/${base0F}";
                      })

                      (mk "chat.deepseek.com" {
                        title = "Deepseek";
                        icon = "icons.ly/chatbot/${base0D}";
                      })

                      (mk "claude.ai" {
                        title = "Claude AI";
                        icon = "icons.ly/claude/${base09}";
                      })
                    ];
                  }
                  {
                    title = "NixOS useful...";
                    same-tab = true;
                    color = mkHsl "base0D";
                    links = [
                      (mk "search.nixos.org/options?channel=unstable" {
                        title = "NixOS Search";
                        icon = "icons.ly/nixos/${base0D}";
                      })

                      (mk "home-manager-options.extranix.com/?query=&release=master" {
                        title = "Home-Manager Search";
                        icon = "icons.ly/nixos/${base0C}";
                      })

                      (mk "wiki.nixos.org" {
                        title = "NixOS Wiki";
                        icon = "icons.ly/nixos/${base0E}";
                      })
                    ];
                  }

                  {
                    title = "Social...";
                    same-tab = true;
                    color = mkHsl "base0B";
                    links = [
                      (mk "anilist.co" {
                        title = "Anilist";
                        icon = "icons.ly/anilist/${base0D}";
                      })

                      (mk "anichart.net" {
                        title = "Anichart";
                        icon = "icons.ly/anichart/${base0C}";
                      })

                      (mk "binternet.private.coffee" {
                        title = "Binternet";
                        icon = "icons.ly/pinterest/${base08}";
                      })

                      (mk "simplytranslate.ducks.party" {
                        title = "Translate";
                        icon = "icons.ly/googletranslate/${base0D}";
                      })

                      (mk "intellectual.ducks.party" {
                        title = "Intellectual";
                        icon = "icons.ly/genius/${base0A}";
                      })
                    ];
                  }
                ];
            }
          ];
        }
      ];
    }
  ];
}
