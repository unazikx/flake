{
  ...
}:

{
  zen.services.minecraft-servers.terra-firma-greg = {
    nixos =
      {
        self',
        pkgs,
        lib,
        ...
      }:
      let
        modpack = self'.packages.minecraft-servers-terra-firma-greg;
      in
      {
        services.minecraft-servers.servers = {
          terra-firma-greg = {
            enable = false;

            autoStart = false;
            # cause it is my personal pc, not server

            managementSystem = {
              tmux.enable = false;
              systemd-socket.enable = true;
            };

            # latest version
            package = pkgs.forgeServers.forge-1_20_1.override {
              jre = pkgs.temurin-bin-17;
            };

            jvmOpts = lib.concatStringsSep " " [
              "-Xmx6024M"
              "-Xms1024M"
            ];

            serverProperties = {
              # https://minecraft.wiki/w/Formatting_codes?section=8#Use_in_server.properties_and_pack.mcmeta
              # there is guide for colorize and styling servername
              motd = "§d§5[ TerraFirmaGreg Modern ] §r§a§l(${modpack.version})";

              level-name = "world";
              level-seed = "-6470279111970926754";
              level-type = "tfc:overworld";

              gamemode = "survival";
              difficulty = "normal";
              hardcore = false;
              pvp = true;
              allow-flight = true;
              allow-nether = false;

              enable-rcon = true;
              "rcon.password" = "@MCRCON_PASS@";
              "rcon.ip" = "0.0.0.0";
              "rcon.port" = 25556;

              max-players = 8;
              online-mode = false;
              # true to license minecraft only
              # i will use 'Alternative Authentication'
              # for ely.by support couse - why not?

              "query.port" = 25555;
              server-port = 25555;
              # i use keendns to open server in worldwideweb
              # https://serverName.routerName.netcraze.club
              # in server list paste it like (without https://)

              broadcast-console-to-ops = true;
              broadcast-rcon-to-ops = true;

              enable-command-block = false;
              enable-jmx-monitoring = false;
              enable-query = false;
              enable-status = true;

              hide-online-players = false;

              view-distance = 8;
              simulation-distance = 8;

              spawn-animals = true;
              spawn-monsters = true;
              spawn-npcs = true;
              spawn-protection = 16;
              generate-structures = true;

              sync-chunk-writes = true;
              use-native-transport = true;
            };

            operators = {
              # for get uuid
              # https://minecraft.wiki/UUID#Player_UUID
              _azikx = {
                uuid = "e6074fe1-b0d5-4394-a860-c84987c52d9a";
                level = 0;
              };
            };

            symlinks = lib.genAttrs [
              "mods"
            ] (dir: "${modpack}/${dir}");

            files = lib.genAttrs [
              "config"
              "defaultconfigs"
              "DiscordIntegration-Data"
              "kubejs"
              "tacz"
              "server-icon.png"
            ] (dir: "${modpack}/${dir}");
          };
        };
      };
  };
}
