# INFO:
# too much groups and hashed passwd

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          lib,
          config,
          ...
        }:
        let
          hashedPasswordFile = config.sopsnix."password";
        in
        {
          services.getty = lib.mkForce {
            autologinUser = lib.userName;
            autologinOnce = true;
          };

          users = {
            defaultUserShell = if config.programs.fish.enable then pkgs.fish else pkgs.bash;

            groups = {
              ${lib.userName} = { };
              media = { };
            };

            users = {
              ${lib.userName} = {
                isNormalUser = true;
                uid = 1000;

                home = "/home/" + lib.userName;
                createHome = true;

                openssh.authorizedKeys.keys = import ./sshKeys.nix;

                extraGroups = [
                  # keep-sorted start
                  "adbusers"
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
                  "qbittorrent"
                  "suwayomi"
                  "terraria"
                  "transmission"
                  "users"
                  "video"
                  "wheel"
                  # keep-sorted end
                ];

                inherit
                  hashedPasswordFile
                  ;

                description = "nixos system user, owner of ${lib.hostName}!";
              };

              root = {
                initialHashedPassword = lib.mkForce null;

                inherit
                  hashedPasswordFile
                  ;
              };

              media = {
                isSystemUser = true;
                group = "media";
              };
            };
          };
        };
    };
}
