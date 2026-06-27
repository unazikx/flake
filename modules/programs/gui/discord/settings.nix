{
  lib,
  config,
  ...
}:

with config.lib.stylix.colors;
{
  useQuickCss = true;

  frameless = true;

  plugins = {
    # keep-sorted start block=yes newline_separated=yes
    #       (
    #         _n:
    #         mkRGB [
    #           base0B-rgb-r
    #           base0B-rgb-g
    #           base0B-rgb-b
    #         ]
    #       )
    #     // (lib.genAttrs
    #       [
    #         "spectrographSolidColor"
    #         "oscilloscopeSolidColor"
    #       ]
    #       (
    #         _n:
    #         mkRGB [
    #           base0C-rgb-r
    #           base0C-rgb-g
    #           base0C-rgb-b
    #         ]
    #       )
    #     )
    #   )
    # ];

    #     oscilloscopeSolidColor = mkRGB [
    #       base0C-rgb-r
    #       base0C-rgb-g
    #       base0C-rgb-b
    #     ];
    #   }
    #   (
    #     lib.genAttrs
    #       [
    #         "oscilloscopeColor"
    #         "spectrographColor"
    #       ]

    # betterActivities.enable = true;

    # betterAudioPlayer = lib.mkMerge [
    #   {
    #     enable = true;

    # betterCommands.enable = true;

    # betterInvites.enable = true;

    # commandPalette.enable = true;

    # declutter.enable = true;

    # gitHubRepos.enable = true;

    # globalBadges.enable = true;

    USRBG.enable = true;

    accountPanelServerProfile.enable = true;

    alwaysAnimate.enable = true;

    alwaysExpandRoles.enable = true;

    alwaysTrust.enable = true;

    anonymiseFileNames.enable = true;

    betterFolders = {
      enable = true;

      closeServerFolder = true;
      keepIcons = true;

      showFolderIcon = 2;
    };

    betterGifPicker.enable = true;

    betterNotesBox.enable = true;

    betterRoleDot.enable = true;

    betterSettings.enable = true;

    betterUploadButton.enable = true;

    copyEmojiMarkdown.enable = true;

    dearrow.enable = true;

    decor.enable = true;

    fakeNitro.enable = true;

    hideMedia.enable = true;

    mentionAvatars.enable = true;

    moreQuickReactions = {
      enable = true;
      compactMode = true;
    };

    openInApp.enable = true;

    translate.enable = true;

    youtubeAdblock.enable = true;
    # keep-sorted end
  };
}
