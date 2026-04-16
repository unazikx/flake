{
  ...
}:

{
  # keep-sorted start block=yes
  # dms-niri-screenshot = {
  #   settings = {
  #   customPath = "~/Pictures/screenshots/scr_%d-%m-%y_%H:%M:%S.png";
  #   };
  # };
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
  niriWindows = {
    enable = true;
    settings = {
      enabled = true;
      noTrigger = false;
      trigger = "win";
    };
  };
  # steamfriends = {
  #   enable = true;
  #   settings = {
  #     apikey = null;
  #     steamid = null;
  #   };
  # };

  # keep-sorted end
}
