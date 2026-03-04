# INFO:
# this tool wipes all / on boot
# but it doesnt delete dirs/files in persist

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          lib,
          config,
          ...
        }:
        let
          cfg = config.persist;
        in
        {
          config = lib.mkIf (lib.persistDir != null) {
            persist = {
              directories = [
                "/var/log"
                "/var/lib/nixos"
                "/var/lib/systemd/coredump"
                "/var/lib/systemd/timers"

                {
                  directory = "/var/lib/colord";
                  user = "colord";
                  group = "colord";
                  mode = "u=rwx,g=rx,o=";
                }
              ];

              files = [ "/etc/machine-id" ];

              user = {
                directories = [ ".ssh" ];
              };
            };

            fileSystems.${lib.persistDir}.neededForBoot = true;
            environment.persistence.${lib.persistDir} = {
              inherit (cfg) directories files;

              users.${lib.userName} = {
                inherit (cfg.user) directories files;
              };

              hideMounts = true;
            };

            boot.initrd = {
              # systemd.enable = lib.mkForce false;
              postDeviceCommands =
                lib.mkAfter
                  #sh
                  ''
                    mkdir /btrfs_tmp
                    mount /dev/disk/by-partlabel/disk-disko-root /btrfs_tmp
                    if [[ -e /btrfs_tmp/root ]]; then
                        mkdir -p /btrfs_tmp/old_roots
                        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
                        mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
                    fi

                    delete_subvolume_recursively() {
                        IFS=$'\n'
                        for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
                            delete_subvolume_recursively "/btrfs_tmp/$i"
                        done
                        btrfs subvolume delete "$1"
                    }

                    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
                        delete_subvolume_recursively "$i"
                    done

                    btrfs subvolume create /btrfs_tmp/root
                    umount /btrfs_tmp
                  '';
            };
          };
        };
    };
}
