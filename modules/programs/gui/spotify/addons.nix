{
  inputs,
  pkgs,
  config,
}:

let
  inherit (inputs.spicetify-nix.legacyPackages.${pkgs.system})
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

        /* .nBGzYhSIK1A7qANmTnpk { background-color: ${base01}; } */
      '';
  };

  enabledExtensions = builtins.attrValues {
    inherit (extensions)
      # keep-sorted start
      adblock
      beautifulLyrics
      betterGenres
      keyboardShortcut
      seekSong
      # keep-sorted end
      ;
  };

  enabledSnippets = builtins.attrValues {
    inherit (snippets)
      # keep-sorted start
      betterLyricsStyle
      centeredLyrics
      fixDjIcon
      fixLikedButton
      fixLikedIcon
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
      moreVisibleUnplayableTracks
      prettyLyrics
      queueTopSidePanel
      removeGradient
      removeTheArtistsAndCreditsSectionsFromTheSidebar
      removeTopSpacing
      roundedImages
      roundedNowPlaying
      # keep-sorted end
      ;
  };
}
