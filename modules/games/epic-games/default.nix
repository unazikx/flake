# INFO:
# egs cli instller
#
# > legendary auth
# > legendary list
# > legendary install

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
          ini = pkgs.formats.ini { };
        in
        {
          persist.user.directories = [ ".config/legendary" ];

          hmPackages = [
            pkgs.legendary-gl
            pkgs.heroic
          ];

          hm.xdg.configFile = {
            "legendary/config.ini".source = ini.generate "legendary-config.ini" {
              "Legendary" = {
                disable_auto_aliasing = false;
                disable_https = false;
                disable_update_check = false;
                disable_update_notice = false;
                install_dir =
                  if (lib.configurationName == "pcRyazenka") then
                    "/media/disks/fastBitch/Games"
                  else
                    config.hm.xdg.userDirs.download;
                locale = "en-US";
                log_level = "debug";
                max_memory = 2048;
                max_workers = 8;
              };
            };
          };
        };
    };
}
