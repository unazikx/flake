{
  ...
}:

{
  zen.users.mathematix = {
    user =
      {
        ...
      }:
      {
        extraGroups = [
          # keep-sorted start
          "audio"
          "input"
          "networkmanager"
          "users"
          "video"
          "wheel"
          # keep-sorted end
        ];
      };
  };
}
