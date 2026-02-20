{
  pkgs,
  config,
}:

let
  inherit (pkgs.spicetify)
    extensions
    snippets
    themes
    ;
in

{
  theme = themes.sleek // {
    additionalCss =
      with config.lib.stylix.colors.withHashtag;
      # css
      ''
        * { font-family: "${config.stylix.fonts.sansSerif.name}" !important }

        .nBGzYhSIK1A7qANmTnpk { background-color: ${base01}; }
      '';
  };

  enabledExtensions = builtins.attrValues {
    inherit (extensions)
      adblock
      beautifulLyrics
      betterGenres
      fullAppDisplayMod
      keyboardShortcut
      seekSong
      ;
  };

  enabledSnippets = builtins.attrValues {
    inherit (snippets)
      betterLyricsStyle
      centeredLyrics
      fixDjIcon
      fixLikedButton
      fixLikedIcon
      fixListenTogetherButton
      fixListeningOn
      fixMainViewWidth
      fixNowPlayingIcon
      fixPlaylistAndFolderPosition
      fixPlaylistHover
      fixProgressBar
      fixedEpisodesIcon
      hideDownloadButton
      hideFriendActivityButton
      hideFullScreenButton
      hideMiniPlayerButton
      hideNowPlayingViewButton
      hidePlayCount
      hidePlayingGif
      hideProfileUsername
      hideSidebarScrollbar
      leftAlignedHeartIcons
      moreVisibleUnplayableTracks
      pointer
      prettyLyrics
      queueTopSidePanel
      removeConnectBar
      removeGradient
      removeTheArtistsAndCreditsSectionsFromTheSidebar
      removeTopSpacing
      roundedImages
      roundedNowPlaying
      ;
  };
}
