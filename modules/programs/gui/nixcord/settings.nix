{
  ...
}:

{
  zen.programs.gui.nixcord.settings = {
    homeManager =
      {
        ...
      }:
      {
        programs.nixcord = {
          vesktop.enable = true; # equibop is newgen vesktop

          vesktopConfig = {
            useQuickCss = true;
            frameless = true;

            plugins = {
              # keep-sorted start block=yes newline_separated=yes
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
          };
        };
      };
  };
}
