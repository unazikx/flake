{
  flake =
    {
      partsConfig,
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
