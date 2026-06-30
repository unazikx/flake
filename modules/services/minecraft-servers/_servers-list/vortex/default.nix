{
  pkgs,
  lib,
  ...
}:

let
  modpack = pkgs.own.games.vortex;
in

{
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
    "-Xmx8192M"
    "-Xms1024M"
  ];

  serverProperties = lib.mkMerge [
    {
      # https://minecraft.wiki/w/Formatting_codes?section=8#Use_in_server.properties_and_pack.mcmeta
      # there is guide for colorize and styling servername
      motd = "§d§5[ Vortex ] §r§a§l(${modpack.version})";

      level-name = "world";
      # level-seed = "-6470279111970926754";
      # level-type = "tfc:overworld";

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
    }
    (import ./settings.nix)
  ];

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
    "journeymap"
    "kubejs"
    "libraries"
    "scripts"
    "server-icon.png"
  ] (dir: "${modpack}/${dir}");
}
