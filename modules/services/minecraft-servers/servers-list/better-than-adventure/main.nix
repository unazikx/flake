{
  pkgs,
  lib,
  ...
}:

{
  enable = true;
  autoStart = true;
  # cause it is my personal pc, not server

  managementSystem = {
    tmux.enable = false;
    systemd-socket.enable = true;
  };

  # https://www.betterthanadventure.net
  package = pkgs.better-than-adventure;

  serverProperties = {
    # https://minecraft.wiki/w/Formatting_codes?section=8#Use_in_server.properties_and_pack.mcmeta
    # there is guide for colorize and styling servername
    motd = "§2§o[ Better Than Adventure! ]";

    view-distance = 14;
    max-players = 8;

    enable-rcon = true;
    "rcon.password" = "@MCRCON_PASS@";
    # enables admin cli
    # /give user minecraft:item ...

    online-mode = false;
    # true makes connect only license minecraft
    # i will use 'Alternative Authentication'
    # for https://ely.by support couse - why not?

    server-port = 25565;
    # i use keendns to open server in worldwideweb
    # https://serverName.routerName.netcraze.club
    # in server list paste it like (without https://)
  };

  operators = {
    # for get uuid
    # https://minecraft.wiki/UUID#Player_UUID
    _azikx = {
      uuid = "e6074fe1-b0d5-4394-a860-c84987c52d9a";
      level = 0;
    };
  };

  jvmOpts = lib.concatStringsSep " " (
    lib.attrValues {
      # val = "..."; without space!!!
      maxRam = "-Xmx6G";
      minRam = "-Xms1G";
    }
  );
}
