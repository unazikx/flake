# INFO:
# something like voicechat

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
            ".config/Mumble"
            ".local/share/Mumble"
          ];

          hmPackages = [ pkgs.mumble ];
        };
    };
}
