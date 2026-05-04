# INFO:
# sound editor
# very powerful

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
            ".config/tenacity"
          ];

          hm.home.packages = [ pkgs.tenacity ];
        };
    };
}
