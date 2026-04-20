# INFO:
# modded games cool manager
# idk butit looks better than r2modman

{
  flake =
    {
      ...
    }:
    {
      nixosModules.${baseNameOf ./.} =
        {
          pkgs,
          ...
        }:
        {
          persist.user.directories = [
            ".config/com.kesomannen.gale"
            ".local/share/com.kesomannen.gale"
            ".local/share/gale"
          ];

          hmPackages = [ pkgs.gale ];
        };
    };
}
