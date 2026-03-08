# INFO:
# new gen nekoray
# good multi-protocol vpn-client

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
          persist.user.directories = [ ".config/Throne" ];

          programs.throne = {
            enable = true;
            tunMode.enable = true;
          };
        };
    };
}
