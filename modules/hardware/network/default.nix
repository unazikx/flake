# INFO:
# connect via nmtui
# also it contains dns resolving

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          inputs,
          pkgs,
          lib,
          ...
        }:
        {
          persist.directories = [
            "/etc/NetworkManager/system-connections"
            "/var/lib/NetworkManager"
            "/var/lib/iwd"
          ];

          networking = {
            useDHCP = lib.mkDefault true;

            networkmanager = {
              enable = true;

              wifi = {
                powersave = true;
                macAddress = "random";
                backend = "iwd";
              };
            };

            nameservers = [
              "1.1.1.1"
              "8.8.8.8"
              "84.21.189.133"
              "83.220.169.155"
            ];

            extraHosts = import ./hosts.nix {
              inherit inputs pkgs lib;
              blackList = [
                "api.github.com"
              ];
            };

            # INFO:
            # rutracker trackers
            hosts."163.172.167.207" = [
              "bt.t-ru.org"
              "bt2.t-ru.org"
              "bt3.t-ru.org"
              "bt4.t-ru.org"
              "bt.rutracker.cc"
              "bt2.rutracker.cc"
              "bt3.rutracker.cc"
              "bt4.rutracker.cc"
              "bt.rutracker.org"
              "bt2.rutracker.org"
              "bt3.rutracker.org"
              "bt4.rutracker.org"
            ];
          };

          programs.nm-applet = {
            enable = true;
            indicator = true;
          };
        };
    };
}
