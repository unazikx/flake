{
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;

# css
''
  base00: ${base00};
  base01: ${base01};
  base02: ${base02};
  base03: ${base03};
  base04: ${base04};
  base05: ${base05};
  base06: ${base06};
  base07: ${base07};
  base08: ${base08};
  base09: ${base09};
  base0A: ${base0A};
  base0B: ${base0B};
  base0C: ${base0C};
  base0D: ${base0D};
  base0E: ${base0E};
  base0F: ${base0F};

  base00T: ${base00}cc;
  base01T: ${base01}cc;
  base02T: ${base02}cc;
  base03T: ${base03}cc;
  base04T: ${base04}cc;
  base05T: ${base05}cc;
  base06T: ${base06}cc;
  base07T: ${base07}cc;
  base08T: ${base08}cc;
  base09T: ${base09}cc;
  base0AT: ${base0A}cc;
  base0BT: ${base0B}cc;
  base0CT: ${base0C}cc;
  base0DT: ${base0D}cc;
  base0ET: ${base0E}cc;
  base0FT: ${base0F}cc;

  pBg: base00;
  pSelection: base02;
  pFg: base05;
  pComment: base03;
  pCyan: base0C;
  pGreen: base0B;
  pOrange: base09;
  pPink: base0E;
  pPurple: base0D;
  pRed: base08;
  pYellow: base0A;
  pAnthracite: base03;
  rippleBgHeavy: base00;
  rippleBgLight: base01;
  cBlack: base00;
  cWhite: base05;
  cTransparent: #00000000;

  activeButtonBg: pComment; // Raised Button bg
  activeButtonBgOver: pPurple;  // Raised Button hover bg
  activeButtonBgRipple: rippleBgHeavy; // Raised Button ripple color (and slected chat contact ripple?)
  activeButtonFg: windowBg; // Raised Button text color
  activeButtonFgOver: activeButtonFg; // Raised Button hover text color
  activeButtonSecondaryFg: pFg; // Numbers (badges) text color on raised buttons
  activeButtonSecondaryFgOver: activeButtonSecondaryFg; // activeButtonSecondaryFg on hover
  activeLineFg: windowActiveTextFg; // Active text input bottom border color
  activeLineFgError: pRed; // activeLineFg but on error
  attentionButtonBgOver: base08T; // Warning button bg color hover !!(pRed with transparency)!! [te]
  attentionButtonBgRipple: rippleBgLight; // Warning button ripple color
  attentionButtonFg: pRed; // Warning button text color
  attentionButtonFgOver: attentionButtonFg; // Warning button text color hover
  boxBg: windowBg;
  boxSearchBg: boxBg;
  boxSearchCancelIconFg: cancelIconFg;
  boxSearchCancelIconFgOver: cancelIconFgOver;
  boxTextFg: windowFg;
  boxTextFgError: pRed;
  boxTextFgGood: pGreen;
  boxTitleAdditionalFg: pCyan; // [te]
  boxTitleCloseFg: cancelIconFg;
  boxTitleCloseFgOver: cancelIconFgOver;
  boxTitleFg: cWhite;
  cancelIconFg: menuIconFg; // Main close menu color (like option close)
  cancelIconFgOver: pRed; // & on hover [te]
  checkboxFg: pComment; // checkbox inactive border [te]
  contactsBg: windowBg; // Contact bg color on contacts page
  contactsBgOver: windowBgOver;
  contactsNameFg: base05; // Contact name color on contacts page [te]
  contactsStatusFg: windowSubTextFg; // Contact status color on contacts page
  contactsStatusFgOnline: windowActiveTextFg;
  contactsStatusFgOver: base04;
  dialogsBg: windowBg;
  dialogsBgActive: pSelection;
  dialogsBgOver: windowBgOver;
  dialogsChatIconFg: pOrange; // [te]
  dialogsChatIconFgActive: pPurple;
  dialogsChatIconFgOver: dialogsChatIconFg;
  dialogsDateFg: windowSubTextFg;
  dialogsDateFgActive: base04;
  dialogsDateFgOver: windowSubTextFgOver;
  dialogsDraftFg: pRed; // Draft label color
  dialogsDraftFgActive: dialogsDraftFg;
  dialogsDraftFgOver: dialogsDraftFg;
  dialogsForwardBg: dialogsBgActive;
  dialogsForwardFg: pCyan; // [te]
  dialogsMenuIconFg: menuIconFg; // menu hamburger color
  dialogsMenuIconFgOver: menuIconFgOver;
  dialogsNameFg: base05; // Chat names color
  dialogsNameFgActive: pPink;
  dialogsNameFgOver: windowBoldFgOver;
  dialogsSendingIconFg: pOrange; // ??? little clock icon on chat contact (the ones on left sidebar) when sending
  dialogsSendingIconFgActive: dialogsSendingIconFg;
  dialogsOnlineBadgeFgActive: base0B;
  dialogsSendingIconFgOver: dialogsSendingIconFg;
  dialogsSentIconFg: pGreen;
  dialogsSentIconFgActive: dialogsSentIconFg;
  dialogsSentIconFgOver: dialogsSentIconFg;
  dialogsTextFg: windowSubTextFg;
  dialogsTextFgActive: base04;
  dialogsTextFgOver: windowSubTextFgOver;
  dialogsTextFgService: base0E;
  dialogsTextFgServiceActive: pOrange; // [te]
  dialogsTextFgServiceOver: dialogsTextFgService;
  dialogsUnreadBg: base0D; // [te]
  dialogsUnreadBgActive: dialogsUnreadBg;
  dialogsUnreadBgMuted: pSelection; // [te]
  dialogsUnreadBgMutedActive: dialogsUnreadBgMuted;
  dialogsUnreadBgMutedOver: dialogsUnreadBgMuted;
  dialogsUnreadBgOver: dialogsUnreadBg;
  dialogsUnreadFg: pFg; // [te]
  dialogsUnreadFgActive: dialogsUnreadFg;
  dialogsUnreadFgOver: dialogsUnreadFg;
  dialogsVerifiedIconBg: pCyan; // verified icon bg [te]
  dialogsVerifiedIconBgActive: dialogsVerifiedIconBg;
  dialogsVerifiedIconBgOver: dialogsVerifiedIconBg;
  dialogsVerifiedIconFg: pBg; // verified icon text color [te]
  dialogsVerifiedIconFgActive: dialogsVerifiedIconFg;
  dialogsVerifiedIconFgOver: dialogsVerifiedIconFg;
  emojiPanBg: windowBg; // Emoji window bg
  emojiPanCategories: emojiPanBg;
  emojiPanHeaderBg: emojiPanBg;
  emojiPanHeaderFg: windowSubTextFg;
  filterInputBorderFg: pComment; // Search box active border
  filterInputInactiveBg: base01T; // [te]
  historyCaptionInFg: historyTextInFg;
  historyCaptionOutFg: historyTextOutFg;
  historyComposeAreaBg: windowBg;
  historyComposeAreaFg: historyTextInFg;
  historyComposeAreaFgService: pFg; // [te]
  historyComposeButtonBg: historyComposeAreaBg;
  historyComposeButtonBgOver: windowBgOver;
  historyComposeButtonBgRipple: windowBgRipple;
  historyComposeIconFg: menuIconFg; // Bottom chat icons (Attach File, Emoji, Microphone)
  historyComposeIconFgOver: menuIconFgOver;
  historyFileNameInFg: historyTextInFg;
  historyFileNameOutFg: historyTextOutFg;
  historyForwardChooseBg: pComment;
  historyForwardChooseFg: cWhite;
  historyIconFgInverted: pGreen; // [te]
  historyOutIconFg: pGreen;
  historyOutIconFgSelected: pGreen;
  historyPeer1NameFg: pRed; // [te]
  historyPeer1UserpicBg: pRed; // [te]
  historyPeer2NameFg: pGreen; // [te]
  historyPeer2UserpicBg: pGreen; // [te]
  historyPeer3NameFg: pYellow; // [te]
  historyPeer3UserpicBg: pYellow; // [te]
  historyPeer4NameFg: pCyan; // [te]
  historyPeer4UserpicBg: pCyan; // [te]
  historyPeer5NameFg: pPurple; // [te]
  historyPeer5UserpicBg: pPurple; // [te]
  historyPeer6NameFg: pPink; // [te]
  historyPeer6UserpicBg: pPink; // [te]
  historyPeer7NameFg: pAnthracite; // [te]
  historyPeer7UserpicBg: pAnthracite; // [te]
  historyPeer8NameFg: pOrange; // [te]
  historyPeer8UserpicBg: pOrange; // [te]
  historyPeerUserpicFg: pBg; //  [te]
  historyPinnedBg: windowBg;
  historyReplyBg: historyComposeAreaBg;
  historyReplyCancelFg: cancelIconFg;
  historyReplyCancelFgOver: pRed; // [te]
  historyReplyIconFg: windowBgActive;
  historyScrollBarBg: scrollBarBg;
  historyScrollBarBgOver: scrollBarBgOver;
  historyScrollBg: scrollBg;
  historyScrollBgOver: scrollBgOver;
  historySendIconFg: menuIconFg; // Paper plane icon that shows when text is typed (click to send)
  historySendIconFgOver: pGreen; // [te]
  historySendingInIconFg: pOrange; // [te]
  historySendingInvertedIconFg: pOrange; // little 'eye' icon on some media msgs (ie sticker, image) to indicate views? [te]
  historySendingOutIconFg: pOrange; // [te]
  historySystemBg: pYellow; // [te]
  historySystemBgSelected: pOrange; // [te]
  historySystemFg: pBg; // windowFgActive; [te]
  historyTextInFg: windowFg;
  historyTextOutFg: windowFg;
  historyToDownBg: base01; // [te]
  historyToDownShadow: cTransparent;
  historyUnreadBarBg: pSelection;
  historyUnreadBarBorder: pSelection;
  historyUnreadBarFg: cWhite;
  imageBg: cBlack; // ???
  imageBgTransparent: cWhite; // ???
  inputBorderFg: pComment; // Input text field undeline when not active
  introBg: windowBg;
  introCoverBottomBg: pBg; // [te]
  introCoverIconsFg: pComment; // [te]
  introCoverPlaneInner: pCyan; // [te]
  introCoverPlaneOuter: pCyan; // [te]
  introCoverPlaneTop: pCyan; // [te]
  introCoverPlaneTrace: pCyan; // [te]
  introCoverTopBg: pBg; // [te]
  introDescriptionFg: windowSubTextFg;
  introErrorFg: pRed; // [te]
  introTitleFg: windowBoldFg;
  layerBg: base01T; // bg overlay when menu is up [te]
  lightButtonBg: windowBg; // Flat button bg color
  lightButtonBgOver: pSelection; // Flat button bg color on hover
  lightButtonBgRipple: rippleBgLight; // Flat button ripple color
  lightButtonFg: pComment; // Flat button text color [te]
  lightButtonFgOver: activeButtonBgOver; // Flat button text color on hover
  mainMenuBg: windowBg;
  mainMenuCoverBg: pSelection; // [te]
  mainMenuCoverFg:  pGreen; // [te]
  mediaInFg: pOrange; // [te]
  mediaInFgSelected: pOrange; // [te]
  mediaOutFg: pOrange; // [te]
  mediaOutFgSelected: pOrange; // [te]
  mediaPlayerActiveFg: pGreen; // [te]
  mediaPlayerBg:  pBg; //  [te]
  mediaPlayerDisabledFg: pSelection; // [te]
  mediaPlayerInactiveFg: pComment; // [te]
  mediaviewBg: #000000cc; // [te]
  mediaviewCaptionBg: pBg; //  [te]
  mediaviewCaptionFg: cWhite;
  mediaviewControlBg: pBg; //  [te]
  mediaviewControlFg: base05; // windowFgActive; [te]
  mediaviewFileBg: pSelection; //  [te]
  mediaviewFileBlueCornerFg: base0D; // [te]
  mediaviewFileExtFg: pBg; // [te]
  mediaviewFileGreenCornerFg: base0B; // [te]
  mediaviewFileNameFg: windowFg;
  mediaviewFileRedCornerFg: base08; // [te]
  mediaviewFileSizeFg: pOrange; //windowSubTextFg; [te]
  mediaviewFileYellowCornerFg: base0A; // [te]
  mediaviewMenuBg: pBg; // [te]
  mediaviewMenuBgOver: pSelection; // [te]
  mediaviewMenuBgRipple: rippleBgLight; // [te]
  mediaviewMenuFg: base0F; // windowFgActive; [te]
  mediaviewPlaybackActive: pGreen; // [te]
  mediaviewPlaybackActiveOver: pGreen; // [te]
  mediaviewPlaybackIconFg: base04; // [te]
  mediaviewPlaybackIconFgOver: mediaviewPlaybackActiveOver;
  mediaviewPlaybackInactive: pSelection; //windowSubTextFg; [te]
  mediaviewPlaybackInactiveOver: pComment; //windowSubTextFgOver; [te]
  mediaviewPlaybackProgressFg: pFg; // [te]
  mediaviewSaveMsgBg: toastBg;
  mediaviewSaveMsgFg: toastFg;
  mediaviewTextLinkFg: pCyan; // [te]
  mediaviewTransparentBg: cBlack; // [te]
  mediaviewTransparentFg: base03; // [te]
  mediaviewVideoBg:  #000000;
  membersAboutLimitFg: pRed; // [te]
  menuBg: windowBg; // Menu bg color
  menuBgOver: windowBgOver; // Menu bg color on hover
  menuBgRipple: windowBgRipple; // Icon ripple color
  menuFgDisabled: pSelection; // Disabled menu text color
  menuIconFg: pComment; // Menu Icon text color
  menuIconFgOver: pPurple; // Menu Icon text color on hover
  menuSeparatorFg: base06T; // [te]
  menuSubmenuArrowFg: pComment; // ???
  msgBotKbIconFg: pBg; //  [te]
  msgBotKbOverBgAdd: rippleBgLight; // [te]
  msgBotKbRippleBg: activeButtonBgRipple; //menuBgRipple; // Bot (system) chat buttons [ie theme like/dislike]
  msgDateImgBg: windowBg;
  msgDateImgBgOver: windowBgOver;
  msgDateImgBgSelected: windowBgOver;
  msgDateImgFg: windowFg;
  msgFile1Bg: pCyan; // [te]
  msgFile1BgDark: base0D; // [te]
  msgFile1BgOver: base0D; // [te]
  msgFile1BgSelected: base0D; // [te]
  msgFile2Bg: pGreen; // [te]
  msgFile2BgDark: base0B; // [te]
  msgFile2BgOver: base0B; // [te]
  msgFile2BgSelected: base0B; // [te]
  msgFile3Bg: pRed; // [te]
  msgFile3BgDark: base08; // [te]
  msgFile3BgOver: base08; // [te]
  msgFile3BgSelected: base08; // [te]
  msgFile4Bg: pYellow; // [te]
  msgFile4BgDark: base0A; // [te]
  msgFile4BgOver: base0A; // [te]
  msgFile4BgSelected: base0A; // [te]
  msgFileInBg: pPink; // [te]
  msgFileInBgOver: pFg; // [te]
  msgFileInBgSelected: pComment; // [te]
  msgFileOutBg: base0D; // [te]
  msgFileOutBgOver: pFg; // [te]
  msgFileOutBgSelected: pSelection; //  [te]
  msgFileThumbLinkInFg: pYellow; // [te]
  msgFileThumbLinkInFgSelected: pComment; // [te]
  msgFileThumbLinkOutFg: pYellow; // [te]
  msgFileThumbLinkOutFgSelected: pComment; // [te]
  msgImgReplyBarColor: activeLineFg;
  msgInBg: base01;
  msgInBgSelected: base02;
  msgInDateFg: base05; // Date in IN msg (text color) [ie time recieved] [te]
  msgInDateFgSelected: base04; // msgInDateFG but when msg is selected [te]
  msgInMonoFg: pOrange; // [te]
  msgInReplyBarColor: base0C;
  msgInReplyBarSelColor: activeLineFg;
  msgInServiceFg: windowActiveTextFg; // Chat name color when system message in (ie the computer... Forwarded by, Channels, etc)
  msgInServiceFgSelected: windowActiveTextFg; // msgInServiceFg when selected
  msgInShadow: cTransparent;
  msgInShadowSelected: cTransparent;
  msgOutBg: base01;
  msgOutBgSelected: base02;
  msgOutDateFg: base05; // Date in OUT msg (text color) [ie time sent] [te]
  msgOutDateFgSelected: base04; // msgOutDateFG but when msg is selected [te]
  msgOutMonoFg: pOrange; // [te]
  msgOutReplyBarColor: activeLineFg;
  msgOutReplyBarSelColor: activeLineFg;
  msgOutServiceFg: windowActiveTextFg; // msgInServiceFg but out instead
  msgOutServiceFgSelected: windowActiveTextFg; // msgOutServiceFg when selected
  msgOutShadow: cTransparent;
  msgOutShadowSelected: cTransparent;
  msgSelectOverlay: base01T;
  msgServiceBg: base01T; // Sticker reply, dates in chat history, bot buttons [te]
  msgServiceBgSelected: base0ET; // [te]
  msgServiceFg: base05; // [te]
  msgStickerOverlay: rippleBgHeavy;
  msgWaveformInActive: pGreen; // Waveforms for audio messages (active is the played part)
  msgWaveformInActiveSelected: pGreen;
  msgWaveformInInactive: windowBg;
  msgWaveformInInactiveSelected: windowBg;
  msgWaveformOutActive: pGreen;
  msgWaveformOutActiveSelected: pGreen;
  msgWaveformOutInactive: windowBg;
  msgWaveformOutInactiveSelected: windowBg;
  notificationBg: windowBg;
  notificationSampleCloseFg: pRed; // [te]
  notificationSampleNameFg: pYellow; // [te]
  notificationSampleTextFg: pFg; // [te]
  notificationSampleUserpicFg:  pCyan; // [te]
  notificationsBoxMonitorFg: windowFg;
  notificationsBoxScreenBg: pSelection; // [te]
  outlineButtonBg: windowBg; // Outline Button bg
  outlineButtonBgOver: pSelection; // Outline Button bg on hover [te]
  outlineButtonBgRipple: rippleBgLight;  // Outline Button ripple color
  outlineButtonOutlineFg: windowActiveTextFg; // Outline Button indicator color
  overviewCheckBg: cTransparent; // [te]
  overviewCheckFg: windowBg;
  overviewCheckFgActive: windowBg;
  overviewPhotoSelectOverlay: rippleBgHeavy; // [te]
  photoCropFadeBg: layerBg;
  photoCropPointFg: pComment;
  placeholderFg: pSelection; //windowSubTextFg; [te]
  placeholderFgActive: pComment;
  profileStatusFgOver: pPurple;
  profileVerifiedCheckBg: pCyan; // [te]
  radialBg: pSelection; // ??? [te]
  radialFg: pPink; // ??? [te]
  reportSpamBg: emojiPanHeaderBg;
  reportSpamFg: windowFg;
  scrollBarBg: pComment; // Scroll Bar current slider color (indicator)
  scrollBarBgOver: pPurple; // Scroll Bar current slider color on hover
  scrollBg: pSelection; // Scroll Bar track bg color
  scrollBgOver: scrollBg; // Scroll Bar track bg color on hover
  searchedBarBg: pBg; // Results & 'no msgs found' msg in search results [te]
  searchedBarBorder: cTransparent; // [te]
  searchedBarFg: base05; // Text 'Search for messages' in search results. [te]
  shadowFg: cTransparent; // [te]
  sideBarBadgeBg: pPink; // filters side bar badge background
  sideBarBadgeBgMuted: pComment; // filters side bar unimportant badge background
  sideBarBadgeFg: pBg; // filters side bar badge background
  sideBarBg: pBg; // filters side bar background
  sideBarBgActive: base01; // filters side bar active background
  sideBarBgRipple: rippleBgLight; // filters side bar ripple effect
  sideBarIconFg: base02; // filters side bar icon
  sideBarIconFgActive: pFg; // filters side bar active item icon
  sideBarTextFg: base02; // filters side bar text
  sideBarTextFgActive: pFg; // filters side bar active item text
  slideFadeOutBg: windowBg; // ???
  slideFadeOutShadowFg: cTransparent; // ??? [te]
  sliderBgActive: pGreen; // A slider is the bottom border on tabs that slides around
  sliderBgInactive: pSelection; // windowBgActive;
  smallCloseIconFg: pComment; // Small menu close button color (its tiny)
  smallCloseIconFgOver: pRed; // smallCloseIconFg on hover [te]
  stickerPanDeleteBg: base08T; // [te]
  stickerPanDeleteFg: pRed; // windowFgActive; [te]
  stickerPreviewBg: cTransparent;
  titleBg: pBg; // Window top bar bg color
  titleBgActive: pBg; //  [te]
  titleButtonBg: cTransparent; // [te]
  titleButtonBgActive: cTransparent; // [te]
  titleButtonBgActiveOver: pSelection; // [te]
  titleButtonBgOver: cTransparent; // ??? [te]
  titleButtonCloseBg: cTransparent; // [te]
  titleButtonCloseBgActive: cTransparent; // [te]
  titleButtonCloseBgActiveOver: pSelection; // [te]
  titleButtonCloseBgOver: cTransparent; // ??? [te]
  titleButtonCloseFg: pSelection; // [te]
  titleButtonCloseFgActive: pRed; // [te]
  titleButtonCloseFgActiveOver: titleButtonCloseFgOver;
  titleButtonCloseFgOver: pRed; // ??? [te]
  titleButtonFg: pSelection; // [te]
  titleButtonFgActive: pOrange; // [te]
  titleButtonFgActiveOver: pOrange; // [te]
  titleButtonFgOver: pOrange; // ??? [te]
  titleFg: pComment; // Window Title color
  titleFgActive: pPurple; // Window Title color when active [te]
  titleShadow: cTransparent;
  toastBg: pComment; // [te]
  toastFg: cWhite;
  tooltipBg: base01T; // [te]
  tooltipBorderFg: cTransparent; // [te]
  tooltipFg: pFg; // [te]
  topBarBg: windowBg;
  trayCounterBg: pRed; // Tray icon counter background for unread messages
  trayCounterBgMacInvert: pComment; // ??? [te]
  trayCounterBgMute: pBg; // ??? [te]
  trayCounterFg: pFg; // ??? [te]
  trayCounterFgMacInvert: pFg; // ??? [te]
  videoPlayIconBg: pComment; // [te]
  videoPlayIconFg: pFg; // [te]
  windowActiveTextFg: pCyan; // Hyperlink text color (and text input active labels)
  windowBg: pBg; // Main bg
  windowBgActive: pGreen; // Checked radio and checkbox color
  windowBgOver: rippleBgLight; // Generic bg hover color (random bits and pieces) & Search bar bg
  windowBgRipple: rippleBgLight; // Ripple color (on hover colored items) [te]
  windowBoldFg: base05; // Bolded text (headers) [te]
  windowBoldFgOver: windowBoldFg; // windowBoldFg but on hover (idk where used)
  windowFg: pFg; // Text color etc.
  windowFgActive: pBg; // Button Text [te]
  windowFgOver: windowFg; // Text color on hover
  windowShadowFg: #000000f0; // [te]
  windowShadowFgFallback: cBlack; // [te]
  windowSubTextFg: pComment; // Minor text and some labels (version number, last seen, etc.)
  windowSubTextFgOver: pPurple; // Hotkey hover text color?
  youtubePlayIconBg: pRed;
  youtubePlayIconFg: pFg;
''
