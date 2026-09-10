{
  ...
}:

{
  zen.users.chizea = {
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
