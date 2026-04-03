# INFO:
# my favorite launcher for exe
# with separate on:
#                  default umu-run
#                  modified uwu-run

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
            pkgs.umu-launcher

            (pkgs.steam.buildRuntimeEnv {
              pname = "umu-launcher";
              inherit (pkgs.umu-launcher-unwrapped)
                version
                meta
                ;

              extraPkgs = pkgs: [ pkgs.umu-launcher-unwrapped ];
              extraEnv = {
                PROTONPATH = pkgs.proton-ge-bin.steamcompattool;
                WINEPREFIX = lib.concatStringsSep "/" [
                  config.hm.xdg.userDirs.publicShare
                  "wine-prefix"
                ];
              };

              executableName = pkgs.umu-launcher-unwrapped.meta.mainProgram;
              runScript = lib.getExe pkgs.umu-launcher-unwrapped;

              dieWithParent = false;

              extraInstallCommands = ''
                mv $out/bin/umu-run $out/bin/uwu-run
                ln -s ${pkgs.umu-launcher-unwrapped}/lib $out/lib
                ln -s ${pkgs.umu-launcher-unwrapped}/share $out/share
              '';
            })
          ];

          hm.xdg.configFile."protonfixes" = {
            recursive = true;
            source = inputs.umu-protonfixes;
          };
        };
    };
}
