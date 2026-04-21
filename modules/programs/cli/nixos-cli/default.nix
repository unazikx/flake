# INFO:
# unified NixOS replacement tools

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
          ...
        }:
        {
          hmPackages = [
            pkgs.nix-output-monitor
          ];

          programs.nixos-cli = {
            enable = true;

            settings = {
              config_location = "${lib.flakeDir}#${lib.configurationName}";

              apply.use_nom = true;

              differ = {
                tool = "command";
                command = [
                  (lib.getExe pkgs.nvd)
                  "diff"
                ];
              };
            };
          };
        };
    };
}
