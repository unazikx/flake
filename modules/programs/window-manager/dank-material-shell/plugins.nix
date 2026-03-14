{
  ...
}:

{
  calculator = {
    enable = true;
    settings = {
      trigger = "calc";
      persistHistoryOnFile = true;
      noTrigger = false;
      calcEngine = "default";
    };
  };

  dankBitwarden = {
    enable = false; # no, just...no
    settings = {
      trigger = "bw";
      noTrigger = false;
    };
  };

  # dms-niri-screenshot = {
  #   settings = {
  #   customPath = "~/Pictures/screenshots/scr_%d-%m-%y_%H:%M:%S.png";
  #   };
  # };

  niriWindows = {
    enable = true;
    settings = {
      enabled = true;
      noTrigger = false;
      trigger = "win";
    };
  };

  # WARN:
  # is it safe to paste directly?
  # hmmmm...
  #
  # steamfriends = {
  #   enable = true;
  #   settings = {
  #     apikey = null;
  #     steamid = null;
  #   };
  # };
}
