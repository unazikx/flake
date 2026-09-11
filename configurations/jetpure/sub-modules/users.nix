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
        users.mutableUsers = false;

        users.users.root = {
          hashedPasswordFile = config.sops.secrets."password/root".path;
        };

        sops.secrets = {
          "password/nixzoid" = {
            neededForUsers = true;
          };

          "password/root" = {
            neededForUsers = true;
          };
        };
      };
  };

  zen.users.nixzoid = {
    user =
      {
        config,
        user,
        ...
      }:
      {
        hashedPasswordFile = config.sops.secrets."password/${user.userName}".path;

        extraGroups = [
          # keep-sorted start
          "audio"
          "deluge"
          "docker"
          "gamemode"
          "input"
          "libvirtd"
          "media"
          "minecraft"
          "networkmanager"
          "podman"
          "proxy-suite"
          "qbittorrent"
          "suwayomi"
          "terraria"
          "transmission"
          "users"
          "video"
          "wheel"
          config.services.kubo.group
          # keep-sorted end
        ];
      };
  };
}
