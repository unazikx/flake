# INFO:
# minecraft servers launches via systemd units
# 25500 - 25599 ports are for minecraft servers

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
        }@args: # needed
        let
          cfg = config.services.minecraft-servers;

          dir = "/var/lib/minecraft";
        in
        {
          persist.directories = [ dir ];

          sops.secrets = {
            "services/minecraft" = {
              owner = lib.mkForce cfg.user;

              reloadUnits = lib.concatMap (name: [
                "${"minecraft-server-${name}.socket"}"
                "${"minecraft-server-${name}.service"}"
              ]) (lib.attrNames cfg.servers);
              # when u change password
              # servers will be restarted
            };
          };

          packages = lib.attrValues {
            inherit (pkgs)
              packwiz
              mcrcon
              ;
          };

          # i made two secrets couse owners diffirent
          hm.home.sessionVariables = {
            MCRCON_PASS = "$(cat ${config.sopsnix."services/minecraft-main"})";
          };

          services.minecraft-servers = {
            enable = true;
            openFirewall = true;

            eula = true;
            dataDir = dir;
            environmentFile = config.sopsnix."services/minecraft";
            # ^^^ just a plain file
            #
            # password=yourawesomepass

            # INFO:
            # auto generator server
            # .
            #  servers
            # ├  modded
            # │ ├──  jvmOpts.nix
            # │ ├──  main.nix
            # │ └──  mods.nix
            # └  vanilla
            #   ├──  jvmOpts.nix
            #   ├──  main.nix
            #   └──  mods.nix
            #  default.nix
            servers =
              let
                serverDirs = ./_servers-list;

                loadServer = name: import "${serverDirs}/${name}" args;
              in
              lib.mapAttrs (name: _: loadServer name) (
                lib.filterAttrs (_: v: v == "directory") (lib.readDir serverDirs)
              );
          };
        };
    };
}
