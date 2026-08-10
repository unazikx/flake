{
  ...
}:

{
  zen.hosts.jetpure = {
    nixos =
      {
        config,
        ...
      }:
      {
        users = {
          mutableUsers = false;

          users.root = {
            hashedPasswordFile = config.sops.secrets."password/root".path;
          };
        };
      };
  };

  zen.users.hackerx = {
    user =
      {
        ...
      }:
      {
        extraGroups = [
          # keep-sorted start
          "audio"
          "gamemode"
          "input"
          "media"
          "minecraft"
          "networkmanager"
          "podman"
          "proxy-suite"
          "qbittorrent"
          "users"
          "video"
          "wheel"
          # keep-sorted end
        ];
      };
  };
}
