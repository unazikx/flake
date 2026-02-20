{
  config,
}:

{
  "AyuGramDesktop/tdata/ayu_settings.json".text = builtins.toJSON {
    appIcon = "alt";
    channelBottomButton = 0;
    collapseSimilarChannels = true;
    deletedMark = "deleted";
    disableAds = true;
    disableCustomBackgrounds = false;
    disableNotificationsDelay = false;
    disableStories = false;
    editedMark = "edited";
    gifConfirmation = false;
    hideAllChatsFolder = true;
    hideChannelReactions = true;
    hideFromBlocked = false;
    hideGroupReactions = true;
    hideNotificationBadge = false;
    hideNotificationCounters = false;
    hideSimilarChannels = false;
    increaseWebviewHeight = false;
    increaseWebviewWidth = false;
    localPremium = false;
    markReadAfterAction = false;
    monoFont = config.stylix.fonts.monospace.name;
    recentStickersCount = 100;
    replaceBottomInfoWithIcons = true;
    saveDeletedMessages = false;
    saveForBots = false;
    saveMessagesHistory = false;
    sendOfflinePacketAfterOnline = false;
    sendOnlinePackets = true;
    sendReadMessages = true;
    sendReadStories = true;
    sendUploadProgress = true;
    sendWithoutSound = false;
    showAttachButtonInMessageField = true;
    showAttachPopup = true;
    showAutoDeleteButtonInMessageField = true;
    showCommandsButtonInMessageField = true;
    showEmojiButtonInMessageField = true;
    showEmojiPopup = true;
    showGhostToggleInDrawer = true;
    showGhostToggleInTray = true;
    showHideMessageInContextMenu = 2;
    showLReadToggleInDrawer = true;
    showMessageDetailsInContextMenu = 2;
    showMessageSeconds = false;
    showMessageShot = true;
    showMicrophoneButtonInMessageField = true;
    showOnlyAddedEmojisAndStickers = false;
    showPeerId = 2;
    showReactionsPanelInContextMenu = 1;
    showSReadToggleInDrawer = true;
    showStreamerToggleInDrawer = false;
    showStreamerToggleInTray = false;
    showUserMessagesInContextMenu = 2;
    showViewsPanelInContextMenu = 1;
    simpleQuotesAndReplies = false;
    spoofWebviewAsAndroid = false;
    stickerConfirmation = false;
    useScheduledMessages = false;
    voiceConfirmation = false;
    wideMultiplier = 1.6;
  };

  "AyuGramDesktop/tdata/shortcuts-custom.json".text =
    let
      key = keys: command: {
        inherit command keys;
      };
      nor = key null;
    in
    builtins.toJSON [
      (key "alt+," "previous_folder")
      (key "alt+." "next_folder")
      (key "alt+a" "show_archive")
      (key "alt+b" "folder4")
      (key "alt+c" "folder2")
      (key "alt+d" "self_chat")
      (key "alt+f" "media_viewer_video_fullscreen")
      (key "alt+g" "first_chat")
      (key "alt+j" "next_chat")
      (key "alt+k" "previous_chat")
      (key "alt+m" "last_folder")
      (key "alt+n" "folder5")
      (key "alt+q" "close_telegram")
      (key "alt+r" "read_chat")
      (key "alt+s" "show_contacts")
      (key "alt+v" "folder3")
      (key "alt+x" "folder1")
      (key "alt+z" "all_chats")
      (key "alt+return" "message")
      (key "alt+shift+" "media_previous")
      (key "alt+shift+." "media_next")
      (key "alt+shift+/" "media_playpause")
      (key "alt+shift+1" "account1")
      (key "alt+shift+2" "account2")
      (key "alt+shift+3" "account3")
      (key "alt+shift+4" "account4")
      (key "alt+shift+5" "account5")
      (key "alt+shift+6" "account6")
      (key "alt+shift+a" "archive_chat")
      (key "alt+shift+d" "show_chat_menu")
      (key "alt+shift+g" "last_chat")
      (key "alt+shift+q" "quit_telegram")
      (key "alt+shift+s" "show_scheduled")
      (key "alt+shift+return" "message_silently")
      (key "ctrl+alt+return" "message_scheduled")
      (nor "media previous")
      (nor "media next")
      (nor "toggle media play/pause")
      (nor "ctrl+0")
      (nor "ctrl+1")
      (nor "ctrl+2")
      (nor "ctrl+3")
      (nor "ctrl+4")
      (nor "ctrl+5")
      (nor "ctrl+6")
      (nor "ctrl+7")
      (nor "ctrl+8")
      (nor "ctrl+9")
      (nor "ctrl+f")
      (nor "ctrl+j")
      (nor "ctrl+l")
      (nor "ctrl+m")
      (nor "ctrl+q")
      (nor "ctrl+r")
      (nor "ctrl+w")
      (nor "ctrl+\\")
      (nor "ctrl+tab")
      (nor "ctrl+backtab")
      (nor "ctrl+pgup")
      (nor "ctrl+pgdown")
      (nor "ctrl+f4")
      (nor "ctrl+shift+tab")
      (nor "ctrl+shift+up")
      (nor "ctrl+shift+down")
      (nor "alt+up")
      (nor "alt+down")
      (nor "ctrl+alt+home")
      (nor "ctrl+alt+end")
    ];
}
