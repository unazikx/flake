{
  ...
}:

{
  zen.programs.gui.spotify = {
    description = ''
      idk how to login, i am via ~~dns.malw.link~~
      okay... sometimes via vpn lol
      okay... ... ... Russia man... blocks ye
      okay... i just bought subscription
      yeeee...meh

      expires 04.09.2026
    '';

    homeManager =
      {
        inputs,
        inputs',
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
        addons = inputs'.spicetify-nix.legacyPackages;
      in
      {
        imports = [
          inputs.spicetify-nix.homeManagerModules.spicetify
        ];

        programs.spicetify = {
          enable = true;

          alwaysEnableDevTools = true;
          windowManagerPatch = true;
          wayland = true;

          theme = addons.themes.sleek // {
            additionalCss =
              # css
              ''
                * {
                  font-family: "${config.stylix.fonts.sansSerif.name}" !important
                }
              '';
          };

          enabledExtensions = [
            # keep-sorted start
            addons.extensions.adblock
            addons.extensions.beautifulLyrics
            addons.extensions.betterGenres
            addons.extensions.keyboardShortcut
            addons.extensions.seekSong
            # keep-sorted end
          ];

          enabledSnippets = [
            # keep-sorted start
            addons.snippets.betterLyricsStyle
            addons.snippets.centeredLyrics
            addons.snippets.fixDjIcon
            addons.snippets.fixLikedButton
            addons.snippets.fixLikedIcon
            addons.snippets.fixNowPlayingIcon
            addons.snippets.fixPlaylistAndFolderPosition
            addons.snippets.fixPlaylistHover
            addons.snippets.fixProgressBar
            addons.snippets.fixedEpisodesIcon
            addons.snippets.hideDownloadButton
            addons.snippets.hideFriendActivityButton
            addons.snippets.hideFullScreenButton
            addons.snippets.hideMiniPlayerButton
            addons.snippets.hideNowPlayingViewButton
            addons.snippets.hidePlayCount
            addons.snippets.hidePlayingGif
            addons.snippets.hideProfileUsername
            addons.snippets.hideSidebarScrollbar
            addons.snippets.moreVisibleUnplayableTracks
            addons.snippets.prettyLyrics
            addons.snippets.queueTopSidePanel
            addons.snippets.removeGradient
            addons.snippets.removeTheArtistsAndCreditsSectionsFromTheSidebar
            addons.snippets.removeTopSpacing
            addons.snippets.roundedImages
            addons.snippets.roundedNowPlaying
            # keep-sorted end
          ];

          colorScheme = "custom";
          customColorScheme = {
            # keep-sorted start
            accent = colors.base03;
            accent-active = colors.base03;
            accent-inactive = colors.base02;
            banner = colors.base03;
            border-active = colors.base03;
            border-inactive = colors.base03;
            button = colors.base0B;
            button-active = colors.base0B;
            button-disabled = colors.base03;
            card = colors.base00;
            equalizer = colors.base0B;
            header = colors.base00;
            highlight = colors.base04;
            highlight-elevated = colors.base03;
            main = colors.base00;
            main-elevated = colors.base02;
            misc = colors.base02;
            notification = colors.base0A;
            notification-error = colors.base08;
            player = colors.base00;
            selected-row = colors.base03;
            shadow = colors.base00;
            sidebar = colors.base01;
            sidebar-text = colors.base07;
            subtext = colors.base06;
            tab-active = colors.base04;
            text = colors.base06;
            # keep-sorted end
          };
        };
      };
  };
}
