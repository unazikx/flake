{
  ...
}:

{
  flake-file.inputs = {
    nix-minecraft = {
      type = "github";
      owner = "hustlerone";
      repo = "nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  zen.services = {
    description = ''
      minecraft servers launches via systemd units
      25500 - 25599 ports are for minecraft servers

      plan: add servers
    '';

    includes = [ ];

    nixos =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.minecraft-servers;
        dir = "/var/lib/minecraft";
      in
      {
        environment.systemPackages = [
          pkgs.packwiz
          pkgs.mcrcon
        ];

        services.minecraft-servers = {
          enable = true;
          openFirewall = true;

          eula = true;
          dataDir = dir;

          # password=yourawesomepass
          environmentFile = config.sops.secrets."services/minecraft".path;
          # just a plain file ^^^
        };

        sops.secrets."services/minecraft" = {
          owner = lib.mkForce cfg.user;

          # when u change password
          # servers will be restarted
          reloadUnits = lib.concatMap (name: [
            "minecraft-server-${name}.socket"
            "minecraft-server-${name}.service"
          ]) (lib.attrNames cfg.servers);
        };
      };
  };
}
