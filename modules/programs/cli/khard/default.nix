# INFO:
# list ur contacts and edit/sync

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
          partsConfig,
          ...
        }:
        {
          imports = lib.attrValues {
            inherit (partsConfig.nixosModules)
              contacts
              ;
          };

          hm.programs.khard = {
            enable = true;

            settings = {
              "general" = {
                debug = "no";
                default_action = "list";
                editor = [ "$EDITOR" ];
                merge_editor = lib.getExe pkgs.delta;
              };

              "contact table".display = "first_name";
            };
          };
        };
    };
}
