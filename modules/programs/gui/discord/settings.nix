{
  lib,
  config,
  ...
}:

with config.lib.stylix.colors;
let
  mkRGB = list: lib.concatStringsSep ", " list;
in

{
  useQuickCss = true;

  frameless = true;

  plugins = {
    accountPanelServerProfile.enable = true;
    alwaysAnimate.enable = true;
    alwaysExpandRoles.enable = true;
    alwaysTrust.enable = true;
    anonymiseFileNames.enable = true;
    betterActivities.enable = true;
    betterCommands.enable = true;
    betterGifPicker.enable = true;
    betterInvites.enable = true;
    betterNotesBox.enable = true;
    betterRoleDot.enable = true;
    betterSettings.enable = true;
    betterUploadButton.enable = true;
    betterUserArea.enable = true;
    commandPalette.enable = true;
    copyEmojiMarkdown.enable = true;
    dearrow.enable = true;
    decor.enable = true;
    fakeNitro.enable = true;
    gitHubRepos.enable = true;
    globalBadges.enable = true;
    hideMedia.enable = true;
    mentionAvatars.enable = true;
    openInApp.enable = true;
    translate.enable = true;
    USRBG.enable = true;
    youtubeAdblock.enable = true;

    betterAudioPlayer = {
      enable = true;

      oscilloscopeSolidColor = mkRGB [
        base0C-rgb-r
        base0C-rgb-g
        base0C-rgb-b
      ];
    }
    // (
      lib.genAttrs
        [
          "oscilloscopeColor"
          "spectrographColor"
        ]
        (
          _n:
          mkRGB [
            base0B-rgb-r
            base0B-rgb-g
            base0B-rgb-b
          ]
        )
      // (lib.genAttrs
        [
          "spectrographSolidColor"
          "oscilloscopeSolidColor"
        ]
        (
          _n:
          mkRGB [
            base0C-rgb-r
            base0C-rgb-g
            base0C-rgb-b
          ]
        )
      )
    );

    betterFolders = {
      enable = true;

      closeServerFolder = true;
      keepIcons = true;

      showFolderIcon = 2;
    };

    betterQuickReact = {
      enable = true;
      compactMode = true;
    };
  };
}
