{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          ...
        }:
        {
          persist.user.files = [ ".local/share/zoxide/db.zo" ];

          hm.programs.zoxide = {
            enable = true;

            options = [ "--cmd cd" ];
          };
        };
    };
}
