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

  zen.users.nixzoid = {
    user =
      {
        config,
        ...
      }:
      {
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
