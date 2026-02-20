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
          config,
          ...
        }:
        {
          persist.user.directories = [ ".local/share/umu" ];

          hmPackages = [
            pkgs.vkbasalt
            (pkgs.umu-launcher.override {
              extraEnv = {
                PROTONPATH = pkgs.proton-ge-bin.steamcompattool;
                WINEPREFIX =
                  if (lib.winePrefix != null) then
                    lib.winePrefix
                  else
                    (lib.concatStringsSep "/" [
                      config.hm.home.homeDirectory
                      "UnifiedPrefix"
                    ]);
              };
            })
          ];

          hm = {
            home.shellAliases.uwu = "umu-run";
            xdg.configFile."protonfixes" = {
              recursive = true;
              source = inputs.umu-protonfixes;
            };
          };
        };
    };
}
