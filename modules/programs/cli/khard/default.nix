# INFO:
# list ur contacts and edit/sync

{
  flake =
    {
      _config,
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
          imports = lib.attrValues {
            inherit (_config.nixosModules)
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
