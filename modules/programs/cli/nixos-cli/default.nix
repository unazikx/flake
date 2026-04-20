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
          programs.nixos-cli = {
            enable = true;

            option-cache.enable = true;

            settings = {
              config_location = lib.flakeDir;

              use_nvd = true;
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
