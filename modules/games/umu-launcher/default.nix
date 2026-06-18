# INFO:
# my favorite launcher for exe

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
        {
          persist.user.directories = [
            ".local/share/umu"
          ];

          hmPackages = [
            pkgs.vkbasalt
            (pkgs.umu-launcher.override {
              extraEnv = {
                PROTONPATH = pkgs.dwproton-bin.steamcompattool;
                WINEPREFIX = lib.concatStringsSep "/" [
                  config.hm.xdg.userDirs.publicShare
                  "wine-prefix"
                ];
              };
            })
          ];
        };
    };
}
